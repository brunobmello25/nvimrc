# LSP Error with Fugitive Buffers - Investigation & Solution

## Problem

When running `:Gdiff` in fugitive, Neovim would open two windows:
1. The actual file (e.g., `src/entity.odin`)
2. A fugitive buffer showing the git version (e.g., `fugitive:///path/to/repo/.git//0/src/entity.odin`)

This consistently triggered an LSP error:
```
LSP[ols]: Error INVALID_SERVER_MESSAGE: {
  error = {
    code = -32603,
    message = ""
  },
  jsonrpc = "2.0"
}
```

## Root Cause

The issue was caused by a combination of factors:

1. **OLS (Odin Language Server) bug**: The language server doesn't handle non-standard URI schemes gracefully. When it receives LSP protocol messages about a `fugitive://` buffer, it throws an internal server error (-32603) instead of ignoring or properly handling the unknown URI.

2. **Default LSP behavior**: Neovim's LSP client attaches to all buffers matching a server's filetype, including special buffers like fugitive's git objects.

3. **Config priority**: The OLS configuration comes from nvim-lspconfig's runtime files (`lsp/ols.lua`), which has higher priority than global configs and doesn't filter out special buffers.

## Investigation Steps

1. **Initial attempts**: Tried using `LspAttach` autocmds and `BufReadPre` autocmds to prevent attachment - these fired too late or were overridden.

2. **Attempted global config**: Set `vim.lsp.config('*', {...})` with a custom `root_dir` - this had the lowest priority and was overridden by runtime files.

3. **Mason-lspconfig handler**: Tried wrapping `root_dir` in the mason-lspconfig handler - discovered the handler wasn't running for ols at all.

4. **Runtime file discovery**: Found that ols config comes from `/path/to/lazy/nvim-lspconfig/lsp/ols.lua`, which provides a default `root_dir` function that always attaches.

5. **Direct override**: Successfully overrode the ols config after all other setup to ensure highest priority.

## Solution

The proper way to prevent LSP from attaching to special buffers is to use the `root_dir` callback and **not call `on_dir()`** for buffers we want to skip.

In `lua/plugins/config/lsp/init.lua` (at the end, after all other LSP setup):

```lua
-- Override ols config to skip fugitive buffers
local ols_config = vim.lsp.config.ols or {}
local original_ols_root_dir = ols_config.root_dir
ols_config.root_dir = function(bufnr, on_dir)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  -- Skip fugitive and other special URI scheme buffers
  if bufname:match('^fugitive://') or bufname:match('^%w+://') then
    return -- Don't call on_dir(), which prevents LSP activation
  end
  -- Call original root_dir for normal files
  if original_ols_root_dir then
    original_ols_root_dir(bufnr, on_dir)
  else
    on_dir(vim.fn.getcwd())
  end
end
vim.lsp.config.ols = ols_config
```

## How It Works

According to Neovim's LSP documentation (`:help vim.lsp.Config`):

> The function form receives a buffer number and `on_dir` callback which it must call to provide root_dir, or LSP will not be activated for the buffer.

By checking the buffer name and simply **returning without calling `on_dir()`**, we prevent LSP from activating for that buffer entirely. This is the clean, documented way to conditionally skip LSP activation.

## Key Insights

1. **Config priority matters**: In Neovim's LSP config system:
   - Priority 1 (lowest): `vim.lsp.config('*', {...})` global config
   - Priority 2 (medium): Runtime files (`lsp/<name>.lua`)
   - Priority 3 (highest): Direct config assignments

2. **root_dir callback is the gate**: The `root_dir` function is called before LSP attaches. Not calling `on_dir()` prevents attachment entirely - cleaner than attaching and then detaching.

3. **Pattern matching**: Checking for `^fugitive://` catches fugitive buffers, and `^%w+://` catches other special URI schemes.

## Applicability

This same pattern can be applied to other language servers if they have similar issues with special buffers. The fix is both:
- A **workaround** for OLS's lack of URI handling robustness
- A **best practice** to prevent LSP from unnecessarily attaching to special buffers

## References

- Neovim LSP docs: `:help vim.lsp.Config`
- Neovim LSP docs: `:help vim.lsp.enable()`
- Example in docs showing conditional LSP activation based on buffer properties

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
vim.diagnostic.config {
  float = { border = 'rounded' },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    require('plugins.config.lsp.on_attach').on_attach(client, event.buf)
  end,
})

local servers = {
  zls = {},
  gopls = {},
  omnisharp = {
    -- TODO: uncomment this if we have trouble setting up omnisharp
    -- cmd = { 'dotnet', vim.fn.expand '$HOME/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll' },
    -- root_dir = function(fname)
    --   return require('lspconfig.util').root_pattern '.git'(fname) or vim.fn.getcwd()
    -- end,
  },
  ts_ls = {},
  pyright = {},
  texlab = {},
  rust_analyzer = {
    settings = {
      cargo = {
        targetDir = vim.fn.expand '$HOME/.cache/rust-analyzer-target',
      },
    },
  },
  tailwindcss = {},
  clangd = {},
  ols = {},
  lua_ls = {
    -- settings = {
    -- Lua = {
    --   completion = {
    --     callSnippet = 'Replace',
    --   },
    --   workspace = {
    --     checkThirdParty = 'Apply',
    --     userThirdParty = { require('plugins.config.lsp.addons').addons_dir },
    --   },
    -- },
    -- },
  },
}

require('mason').setup()

-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua',
  'prettier',
  'gdtoolkit',
  'jsonlint',
  'yamllint',
  'autopep8',
  'sql-formatter',
  'golangci-lint',
  'clang-format',
  'markdownlint',
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

---@diagnostic disable-next-line: missing-fields
require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities or {})

      vim.lsp.config[server_name] = server
      vim.lsp.enable(server_name)
    end,
  },
}

require 'plugins.config.lsp.languages.gdscript'
require 'plugins.config.lsp.languages.swiprolog'

-- Override ols config to skip fugitive buffers
-- This is necessary because ols config comes from nvim-lspconfig runtime files
-- which have higher priority than our global config
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

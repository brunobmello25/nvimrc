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

-- TODO: uncomment this if I decide to rollback to nvim-cmp from blink.cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
  gopls = {},
  tsserver = {},
  pyright = {},
  texlab = {},
  rust_analyzer = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
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
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

---@diagnostic disable-next-line: missing-fields
require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      -- TODO: uncomment this if I decide to rollback to nvim-cmp from blink.cmp
      -- server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

      server.capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities or {})

      require('lspconfig')[server_name].setup(server)
    end,
  },
}

require 'plugins.config.lsp.languages.gdscript'
require 'plugins.config.lsp.languages.swiprolog'

local on_attach = require('plugins.config.lsp.on_attach').on_attach

require('lspconfig').prolog_ls.setup {
  cmd = { 'swipl', '-g', 'use_module(library(lsp_server)).', '-g', 'lsp_server:main', '-t', 'halt', '--', 'stdio' },
  filetypes = { 'prolog' },
  root_dir = require('lspconfig.util').root_pattern('.git', '*.pl'),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  settings = {
    prolog_ls = {
      -- Custom settings for prolog_ls can go here
    },
  },
}

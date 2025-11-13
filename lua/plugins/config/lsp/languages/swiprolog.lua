vim.lsp.config.prolog_ls = {
  cmd = { 'swipl', '-g', 'use_module(library(lsp_server)).', '-g', 'lsp_server:main', '-t', 'halt', '--', 'stdio' },
  filetypes = { 'prolog' },
  root_markers = { '.git', '*.pl' },
  settings = {
    prolog_ls = {
      -- Custom settings for prolog_ls can go here
    },
  },
}

vim.lsp.enable('prolog_ls')

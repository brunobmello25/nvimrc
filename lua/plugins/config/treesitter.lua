local opts = {
  ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
  auto_install = true,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<leader><CR>',
      node_incremental = '<leader><CR>',
    },
  },
  highlight = {
    enable = true,
    disable = { 'csv' },
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = {
    enable = true,
    disable = { 'ruby' },
  },
}

-- Setup Treesitter with the options defined above
require('nvim-treesitter.install').prefer_git = true

require('nvim-treesitter.configs').setup(opts)

vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

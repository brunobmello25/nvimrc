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

---@diagnostic disable-next-line: redundant-parameter
require('nvim-treesitter').setup(opts)

-- Setup Treesitter with the options defined above
require('nvim-treesitter.install').prefer_git = true

require('nvim-treesitter.configs').setup(opts)

-- TODO: see if I want to keep this new fold settings
-- vim.opt.foldenable = false
-- vim.opt.foldlevel = 99
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append { fold = ' ' }

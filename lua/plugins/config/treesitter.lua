local opts = {
  ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
  -- Autoinstall languages that are not installed
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
    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --  If you are experiencing weird indenting issues, add the language to
    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = { enable = true, disable = { 'ruby' } },
}

---@diagnostic disable-next-line: redundant-parameter
require('nvim-treesitter').setup(opts)

-- Prefer git instead of curl in order to improve connectivity in some environments
require('nvim-treesitter.install').prefer_git = true
---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup(opts)

-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

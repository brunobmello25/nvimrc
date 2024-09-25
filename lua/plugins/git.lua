return {
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup {
        enabled = false,
        ignored_filetypes = { 'netrw' },
      }

      vim.api.nvim_create_user_command('GBT', 'GitBlameToggle', {})
    end,
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', 'gf', '<cmd>diffget //2<CR>', { desc = 'Get left side of diff' })
      vim.keymap.set('n', 'gj', '<cmd>diffget //3<CR>', { desc = 'Get left side of diff' })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  { 'akinsho/git-conflict.nvim', version = '*', config = true },
}

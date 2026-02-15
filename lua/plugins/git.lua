return {
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  { 'akinsho/git-conflict.nvim', version = '*', config = true },

  {
    'liouk/gitlinks.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitlinks').setup()
    end,
  },
}

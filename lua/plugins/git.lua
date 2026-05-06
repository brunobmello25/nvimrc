return {
  { 'tpope/vim-fugitive' },

  { 'akinsho/git-conflict.nvim', version = '*', config = true },

  {
    'liouk/gitlinks.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitlinks').setup()
    end,
  },
}

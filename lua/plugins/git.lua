return {
  { 'tpope/vim-fugitive' },

  { 'akinsho/git-conflict.nvim', version = '*', config = true },

  {
    -- TODO: gitlinks.nvim is archived (2023). It still works, but if it ever
    -- breaks, replace it with gitlinker.nvim.
    'liouk/gitlinks.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitlinks').setup()
    end,
  },
}

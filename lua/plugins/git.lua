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

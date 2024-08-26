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
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = function()
      require 'plugins.config.git'
    end,
  },
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require 'plugins.config.treesitter'
    end,
  },

  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  { 'nvim-treesitter/nvim-treesitter-context' },
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require 'plugins.config.treesitter'
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = { max_lines = 3 },
  },
}

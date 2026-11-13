return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false, -- the main branch does not support lazy-loading
    build = ':TSUpdate',
    config = function()
      require 'plugins.config.treesitter'
    end,
  },

  -- playground was archived upstream: its features live in core nvim now
  -- (`:InspectTree`, `:EditQuery`, `:Inspect`)

  { 'nvim-treesitter/nvim-treesitter-context', opts = {
    max_lines = 3,
  } },
}

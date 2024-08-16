return {
  {
    'isakbm/gitgraph.nvim',
    dependencies = {
      'sindrets/diffview.nvim',
    },
    config = function()
      require 'plugins.config.gitgraph'
    end,
  },
}

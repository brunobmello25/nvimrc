local keys = require 'plugins.pick.keys'

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      picker = {
        enabled = true,
        formatters = {
          file = {
            truncate = 80,
          },
        },
      },
    },
    dependencies = {
      {
        'folke/todo-comments.nvim',
        config = true,
      },
    },
    -- TODO:
    -- list yanked items
    -- customize grep with ctrl+space
    keys = keys,
  },
}

local keys = require 'plugins.pick.keys'

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- notifier = {},
      image = {},
      picker = {
        enabled = true,
        formatters = {
          file = {
            truncate = 80,
          },
        },
        sources = {
          registers = {
            confirm = {
              action = { 'yank', 'close' },
              source = 'registers',
              notify = false,
            },
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
    keys = keys,
    init = function()
      vim.api.nvim_create_user_command('Keymaps', require('snacks').picker.keymaps, {})
    end,
  },
}

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {
        doc = {

          max_width = 30,
          max_height = 30,
          inline = false,
          float = false,
        },
      },
      -- picker = require 'plugins.snacks.config.picker',
      terminal = {},
    },
    dependencies = {
      {
        'folke/todo-comments.nvim',
        config = true,
      },
    },
    keys = require 'plugins.snacks.keys',
    init = function()
      vim.api.nvim_create_user_command('Keymaps', require('snacks').picker.keymaps, {})
    end,
  },
}

local dap = require 'dap'
local dapui = require 'dapui'

require('mason-nvim-dap').setup {
  automatic_installation = true,
  handlers = {},
  ensure_installed = {
    'delve',
  },
}

require 'plugins.config.debug.keymaps'

dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = dapui.open

require 'plugins.config.debug.languages.go'
require 'plugins.config.debug.languages.godot'
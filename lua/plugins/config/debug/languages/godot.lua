local dap = require 'dap'

dap.adapters.godot = {
  type = 'server',
  host = '127.0.0.1',
  port = 6006,
}

dap.configurations.gdscript = {
  {
    type = 'godot',
    request = 'launch',
    name = 'launch main scene',
    project = '${workspaceFolder}',
  },
}

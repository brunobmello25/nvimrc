local dap = require 'dap'

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      -- TODO: make this dynamic
      return vim.fn.getcwd() .. '/target/handmade'
    end,
    cwd = '${workspaceFolder}',
  },
}

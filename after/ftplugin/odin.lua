vim.keymap.set('n', '<leader>dt', function()
  local dap = require 'dap'
  local dir = vim.fn.expand '%:p:h'
  local test_binary = vim.fn.tempname() .. '_odin_dap'

  os.remove(test_binary)

  vim.fn.system {
    'odin', 'test', dir,
    '-debug', '-keep-executable',
    '-out:' .. test_binary,
  }

  if not vim.fn.filereadable(test_binary) then
    vim.notify('odin test compilation failed', vim.log.levels.ERROR)
    return
  end

  dap.run {
    type = 'codelldb',
    request = 'launch',
    name = 'Debug Odin Tests',
    program = test_binary,
    cwd = dir,
    stopOnEntry = false,
    args = {},
  }
end, { desc = 'Debug odin tests' })

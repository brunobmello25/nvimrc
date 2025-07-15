local dap = require 'dap'
local dapui = require 'dapui'

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP continue' })
vim.keymap.set('n', '<F10>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F11>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dr', function()
  dapui.close()
  dapui.open { reset = true }
end, { desc = 'DAP reset UI' })

vim.keymap.set('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>', { desc = 'Debug: Toggle DAP-UI' })
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: conditional breakpoint' })

vim.keymap.set('n', '<leader>de', '<cmd>lua require"dapui".eval()<CR>', { desc = 'DAP eval' })

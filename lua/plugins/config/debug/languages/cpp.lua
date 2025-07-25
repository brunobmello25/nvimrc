local dap = require 'dap'

local mason_path = vim.fn.stdpath 'data' .. '/mason'
local codelldb_path = mason_path .. '/packages/codelldb'
local liblldb_path = codelldb_path .. '/extension/lldb/lib/liblldb.so'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
-- local liblldb_path = extension_path .. 'lldb/lib/liblldb.so' -- adjust if needed

dap.adapters.codelldb = {
  type = 'executable',
  executable = {
    command = codelldb_path .. '/codelldb',
    args = { '--liblldb-path', liblldb_path },
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.getcwd() .. '/target/handmade'
    end,
    cwd = '${workspaceFolder}',
  },
}

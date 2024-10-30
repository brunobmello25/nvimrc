if vim.fn.has 'win32' == 1 then
  require('dap-python').setup(vim.fn.stdpath 'data' .. '\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe')
else
  require('dap-python').setup '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
end

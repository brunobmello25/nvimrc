vim.api.nvim_create_user_command('InspectSlice', function(opts)
  local args = vim.split(opts.args, ' ')
  local var = args[1] or vim.fn.expand '<cword>'
  local count = tonumber(args[2]) or 20
  local expr = string.format('-f hex -- *(unsigned int(*)[%d])%s.data', count, var)
  require('dap').repl.execute('expression ' .. expr)
end, {
  nargs = '*',
  desc = 'Inspect an Odin slice in the DAP REPL',
})

vim.api.nvim_create_user_command('RelativeLineNumber', function()
  local relative_enabled = vim.opt.relativenumber:get()

  if relative_enabled then
    vim.opt.relativenumber = false
  else
    vim.opt.relativenumber = true
  end
end, {})

vim.api.nvim_create_user_command("CopyRelPath", function(opts)
  local path = vim.fn.expand("%:p:.")
  if opts.range > 0 then
    path = path .. ":" .. opts.line1 .. "," .. opts.line2
  end
  vim.fn.setreg("+", path)
end, { range = true })

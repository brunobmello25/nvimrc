vim.api.nvim_create_user_command('SetupCommandOnSave', function()
  local cmd = vim.fn.input 'Command to run on save: '

  local grp = vim.api.nvim_create_augroup('SetupSaveGroup', { clear = true })

  local bufnr = vim.api.nvim_get_current_buf()

  vim.api.nvim_create_autocmd('BufWritePost', {
    group = grp,
    buffer = bufnr,
    callback = function()
      vim.fn.jobstart(cmd, { stdout_buffered = true })
    end,
  })
  print('On‑save hook set: ' .. cmd)
end, {})

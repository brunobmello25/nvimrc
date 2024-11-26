vim.api.nvim_create_user_command('Prompt', function()
  local buffer = vim.api.nvim_create_buf(false, true)

  local win = vim.api.nvim_open_win(buffer, false, {
    split = 'right',
    win = 0,
  })

  vim.api.nvim_set_option_value('filetype', 'markdown', {
    buf = buffer,
  })

  vim.api.nvim_set_current_win(win)

  vim.api.nvim_buf_set_lines(buffer, 0, 0, false, {
    '```',
    '```',
  })
end, {})

---function to check if current window is on an empty buffer.
---if it is, we will use the same window. if it isn't, we will
---open a new window and type the prompt there.
---@return boolean
local is_window_empty = function()
  local buf = vim.api.nvim_get_current_buf()
  local line_count = vim.api.nvim_buf_line_count(buf)

  if line_count == 1 then
    local line_content = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
    return line_content == ''
  end

  return line_count == 0
end

vim.api.nvim_create_user_command('Prompt', function()
  local buffer = vim.api.nvim_create_buf(false, true)

  local win = vim.api.nvim_get_current_win()
  if not is_window_empty() then
    win = vim.api.nvim_open_win(buffer, false, {
      split = 'right',
      win = 0,
    })
  end

  vim.api.nvim_set_option_value('filetype', 'markdown', {
    buf = buffer,
  })

  vim.api.nvim_set_current_win(win)
  vim.api.nvim_set_current_buf(buffer)

  vim.api.nvim_buf_set_lines(buffer, 0, 0, false, {
    '```',
    '```',
  })
end, {})

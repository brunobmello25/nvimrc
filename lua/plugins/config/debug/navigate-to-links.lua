-- Function to jump to file:line from DAP/test output
local function jump_to_file_from_output()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()

  -- Pattern to match file paths with line numbers
  -- Matches: /path/to/file.ext:123 or file.ext:123:45
  local patterns = {
    '([^%s:]+%.%w+):(%d+):?(%d*)', -- filename.ext:line:col
    '([^%s]+):(%d+):?(%d*)', -- /full/path:line:col
  }

  local file, line_num, col_num

  for _, pattern in ipairs(patterns) do
    file, line_num, col_num = line:match(pattern)
    if file and line_num then
      break
    end
  end

  if not file or not line_num then
    print 'No file:line pattern found on current line'
    return
  end

  -- Find the main window (not the DAP output window)
  local current_win = vim.api.nvim_get_current_win()
  local target_win = nil

  -- Look for a normal window (not a DAP/terminal/special buffer)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= current_win then
      local buf = vim.api.nvim_win_get_buf(win)
      local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
      -- Prefer windows with normal buffers
      if buftype == '' then
        target_win = win
        break
      end
    end
  end

  -- If no suitable window found, use the previous window or create split
  if not target_win then
    vim.cmd 'wincmd p' -- Go to previous window
    target_win = vim.api.nvim_get_current_win()
  else
    vim.api.nvim_set_current_win(target_win)
  end

  -- Open the file
  vim.cmd('edit ' .. vim.fn.fnameescape(file))

  -- Jump to line
  vim.api.nvim_win_set_cursor(target_win, { tonumber(line_num), 0 })

  -- Jump to column if specified
  if col_num and col_num ~= '' then
    vim.api.nvim_win_set_cursor(target_win, { tonumber(line_num), tonumber(col_num) - 1 })
  end

  -- Center the view
  vim.cmd 'normal! zz'
end

-- Set up the mapping for DAP/test output buffers
-- You can put this in a FileType autocmd or in your DAP config
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'dap-repl', 'dapui_console', 'dapui_output' }, -- adjust patterns as needed
  callback = function(args)
    vim.keymap.set('n', 'gd', jump_to_file_from_output, {
      buffer = args.buf,
      desc = 'Jump to file:line under cursor',
    })
  end,
})

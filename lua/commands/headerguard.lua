vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.h',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      local guard = (vim.fn.expand('%:t:r'):upper():gsub('[^%w]', '_') .. '_H')
      vim.api.nvim_buf_set_lines(0, 0, -1, false, {
        '#ifndef ' .. guard,
        '#define ' .. guard,
        '',
        '',
        '',
        '#endif',
      })
      vim.api.nvim_win_set_cursor(0, { 4, 0 })
    end
  end,
  desc = 'Add include guard to empty C header files',
})


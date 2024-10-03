-- Create an autocommand group for file type detection
local filetype_group = vim.api.nvim_create_augroup('FileTypeDetect', { clear = true })

-- Set the filetype for .pl files to prolog
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.pl',
  callback = function()
    vim.bo.filetype = 'prolog'
  end,
  group = filetype_group,
})

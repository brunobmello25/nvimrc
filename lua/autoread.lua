-- Automatically reload files when changed externally
vim.opt.autoread = true

-- Check for file changes when entering a buffer, gaining focus, or being idle
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  command = 'checktime',
  desc = 'Check for external file changes',
})

-- Notify when a file is changed outside of Neovim
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded.', vim.log.levels.WARN)
  end,
  desc = 'Notify when file is reloaded due to external changes',
})

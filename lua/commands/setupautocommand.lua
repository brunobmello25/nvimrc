--- This autocommand is useful for running external neovim commands automatically when
--- saving a specific buffer. For example, for running `plantuml something.puml` everytime
--- we save `something.puml`, run `:SetupCommandOnSave` and then pass in
--- the command `plantuml something.puml`
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

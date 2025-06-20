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

vim.api.nvim_create_user_command('PlantUMLAutoBuild', function()
  local ext = vim.fn.expand '%:e'

  if ext ~= 'puml' and ext ~= 'plantuml' then
    local msg = 'This command only works for .puml or .plantuml files.'
    vim.notify(msg, vim.log.levels.WARN)
    return
  end

  local path = vim.fn.expand '%:p'

  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PlantUMLAutoBuildGroup', { clear = true }),
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      local cmd = 'plantuml ' .. path
      vim.fn.jobstart(cmd, { stdout_buffered = true })
    end,
  })
end, {})

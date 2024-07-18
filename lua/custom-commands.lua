local function italicize()
  vim.cmd 'normal! d'
  vim.cmd 'normal! i\\textit{'
  vim.cmd 'normal! p'
  vim.cmd 'normal! a}'
end

local commands_group = vim.api.nvim_create_augroup('CustomCommandsGroup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = commands_group,
  pattern = 'plaintex',
  callback = function()
    vim.keymap.set('v', '<C-i>', italicize, { buffer = 0, desc = 'Insert a tab character' })
  end,
})

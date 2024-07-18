local function italicize()
  vim.cmd 'normal! d'
  vim.cmd 'normal! a\\textit{'
  vim.cmd 'normal! p'
  vim.cmd 'normal! a}'
end

vim.keymap.set('v', '<C-i>', italicize, { buffer = 0, desc = 'Italicize selected text' })

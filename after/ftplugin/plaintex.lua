local function italicize()
  vim.cmd 'normal! d'
  vim.cmd 'normal! a\\textit{'
  vim.cmd 'normal! p'
  vim.cmd 'normal! li}'
end

local function bold()
  vim.cmd 'normal! d'
  vim.cmd 'normal! a\\textbf{'
  vim.cmd 'normal! p'
  vim.cmd 'normal! li}'
end

vim.keymap.set('v', '<C-i>', italicize, { buffer = 0, desc = 'Italicize selected text' })
vim.keymap.set('v', '<C-b>', bold, { buffer = 0, desc = 'Bold selected text' })

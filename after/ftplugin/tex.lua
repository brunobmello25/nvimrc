local function italicize()
  vim.cmd 'normal! d'
  vim.cmd 'normal! i \\textit{'
  vim.cmd 'normal! p'
  vim.cmd 'normal! li}'
end

local function bold()
  vim.cmd 'normal! d'
  vim.cmd 'normal! i \\textbf{'
  vim.cmd 'normal! p'
  vim.cmd 'normal! li}'
end

vim.keymap.set('v', '<C-i>', italicize, { buffer = 0, desc = 'Italicize selected text' })
vim.keymap.set('v', '<C-b>', bold, { buffer = 0, desc = 'Bold selected text' })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

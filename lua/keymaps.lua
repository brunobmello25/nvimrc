-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '[e', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to previous [E]rror message' })
vim.keymap.set('n', ']e', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to next [E]rror message' })

-- quickfix navigation
vim.keymap.set('n', '[q', '<cmd>cprevious<CR>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y<CR>', { desc = 'Yank to clipboard' })

-- run tmux sessionizer
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Sessionizer' })

-- exit with leader q
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', '<cmd>tabclose<CR>', { desc = 'Close tab' })

-- shortcut to <C-w>
vim.keymap.set('n', '<leader>w', '<C-w>', { desc = 'Leader w' })

-- keep visual mode after moving lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- prevent yank when pasting from visual mode
vim.keymap.set('x', 'p', '"_dP', { desc = 'Prevent yank when pasting' })

-- toggle word wrap
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = 'Toggle wrap' })

-- keep cursor centered when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
vim.keymap.set('n', 'gg', 'ggzz', { desc = 'Scroll up' })
vim.keymap.set('n', 'G', 'Gzz', { desc = 'Scroll up' })

-- reselect previous visual selection after indenting
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })

vim.keymap.set('n', '<leader>m', "'", { desc = 'Mark navigation' })

-- resource file
vim.keymap.set('n', '<leader>x', '<cmd>luafile %<CR>', { desc = 'Resource file' })

-- prevent { and } from polluting the jump list
vim.keymap.set('n', '{', '<cmd>silent! execute "keepjumps norm! " . v:count1 . "{"<CR>', { desc = 'Move to previous paragraph' })
vim.keymap.set('n', '}', '<cmd>silent! execute "keepjumps norm! " . v:count1 . "}"<CR>', { desc = 'Move to previous paragraph' })

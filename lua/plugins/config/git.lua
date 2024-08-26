local neogit = require 'neogit'

vim.api.nvim_create_user_command('Blame', 'Git blame', {})
vim.api.nvim_create_user_command('G', 'Neogit', {})

neogit.setup {}

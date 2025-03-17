return {
  {
    'brunobmello25/persist-quickfix.nvim',
    --- @type PersistQuickfix.Config
    opts = {},
    init = function()
      local persist_quickfix = require 'persist-quickfix'

      vim.api.nvim_create_user_command('DeleteQuickfix', function()
        persist_quickfix.choose_delete()
      end, {})

      vim.api.nvim_create_user_command('LoadQuickfix', function()
        persist_quickfix.choose()
      end, {})

      vim.api.nvim_create_user_command('SaveQuickfix', function()
        vim.ui.input({ prompt = 'Quickfix name: ' }, function(value)
          persist_quickfix.save(value)
        end)
      end, {})

      vim.keymap.set('n', '<leader>sq', '<cmd>SaveQuickfix<CR>')

      vim.keymap.set('n', '<leader>lq', '<cmd>LoadQuickfix<CR>')
    end,
  },
}

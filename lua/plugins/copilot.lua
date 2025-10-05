return {

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    dependencies = { 'windwp/nvim-autopairs' },
    event = 'InsertEnter',
    config = function()
      local copilot = require 'copilot'
      local suggestion = require 'copilot.suggestion'
      local autopairs = require 'nvim-autopairs'

      copilot.setup {
        suggestion = {
          auto_trigger = true,
        },
        filetypes = {
          ['*'] = true,
          odin = false,
        },
      }

      vim.keymap.set('i', '<C-u>', function()
        autopairs.disable()
        suggestion.accept()
        autopairs.enable()
      end, { desc = 'Accept Copilot suggestion' })
    end,
    -- init = function()
    --   vim.cmd 'Copilot disable'
    -- end,
  },
}

return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-u>',
        },
        -- ignore_filetypes = { cpp = true },
        log_level = 'info', -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
      }
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      local copilot = require 'copilot'
      -- local suggestion = require 'copilot.suggestion'
      -- local autopairs = require 'nvim-autopairs'

      copilot.setup {
        -- suggestion = {
        --   auto_trigger = true,
        -- },
        -- filetypes = {
        --   ['*'] = true,
        -- },
      }

      -- vim.keymap.set('i', '<C-u>', function()
      --   autopairs.disable()
      --   suggestion.accept()
      --   autopairs.enable()
      -- end, { desc = 'Accept Copilot suggestion' })
    end,
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    config = function()
      require('CopilotChat').setup {
        -- debug=true,
      }

      vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChat<CR>', { noremap = true, silent = true, desc = 'Open Copilot Chat' })
    end,
  },
}

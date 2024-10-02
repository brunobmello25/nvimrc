return {

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    -- config = function()
    --   local copilot = require 'copilot'
    --   local suggestion = require 'copilot.suggestion'
    --   local autopairs = require 'nvim-autopairs'
    --
    --   copilot.setup {
    --     suggestion = {
    --       auto_trigger = true,
    --     },
    --     filetypes = {
    --       ['*'] = true,
    --     },
    --   }
    --
    --   vim.keymap.set('i', '<C-u>', function()
    --     autopairs.disable()
    --     suggestion.accept()
    --     autopairs.enable()
    --   end, { desc = 'Accept Copilot suggestion' })
    -- end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua', 'hrsh7th/nvim-cmp' },
    config = function()
      require('copilot').setup()
      require('copilot_cmp').setup()
    end,
  },
}

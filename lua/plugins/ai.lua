return {
  -- {
  --   'olimorris/codecompanion.nvim',
  --   config = function()
  --     require('codecompanion').setup {
  --       adapters = {
  --         openai = function()
  --           return require('codecompanion.adapters').extend('openai', {
  --             env = {
  --               api_key = 'cmd:bw list items --search "open_ai_api_key"  | jq -r \'.[0].notes\'',
  --             },
  --             schema = {
  --               model = {
  --                 default = 'o4-mini',
  --               },
  --             },
  --           })
  --         end,
  --       },
  --       strategies = {
  --         chat = {
  --           adapter = 'openai',
  --         },
  --         inline = {
  --           adapter = 'openai',
  --         },
  --       },
  --     }
  --
  --     vim.api.nvim_create_user_command('ChatToggle', 'CodeCompanionChat Toggle', { desc = 'Toggle code companion chat' })
  --     vim.keymap.set('n', '<leader>cc', ':ChatToggle<CR>', { desc = 'Toggle code companion chat' })
  --   end,
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  -- },
  {
    'greggh/claude-code.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for git operations
    },
    config = function()
      require('claude-code').setup {
        window = {
          position = 'vertical',
          split_ratio = 0.4,
        },
      }
      vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })
    end,
  },
}

return {
  {
    'ibhagwan/fzf-lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      {
        'folke/todo-comments.nvim',
        config = function()
          require('todo-comments').setup {
            search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
            highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
          }
        end,
      },
    },
    config = function()
      require('fzf-lua').setup {
        'telescope',
        winopts = {
          on_create = function()
            vim.keymap.set('t', '<C-r>', [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
          end,
        },
        grep = {
          hidden = true,
        },
      }

      require('fzf-lua').register_ui_select {
        telescope = {
          layout_config = {
            width = 0.8,
            height = 0.8,
          },
        },
      }
    end,
    init = function()
      vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'FzfLua: Find Files' })
      vim.keymap.set('n', '<leader>fF', ':FzfLua files hidden=true<CR>', { desc = 'FzfLua: Find Files (Hidden)' })
      vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'FzfLua: Buffers' })
      vim.keymap.set('n', '<leader>fd', ':FzfLua diagnostics_workspace<CR>', { desc = 'FzfLua: Diagnostics' })
      vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', { desc = 'FzfLua: Live Grep' })
      vim.keymap.set('n', '<leader>ft', ':TodoFzfLua<CR>', { desc = 'FzfLua: Todo Comments' })
      vim.keymap.set('n', '<leader>fh', ':FzfLua help_tags<CR>', { desc = 'FzfLua: Help Tags' })
      vim.keymap.set('n', '<leader>fk', ':FzfLua keymaps<CR>', { desc = 'FzfLua: Keymaps' })
      vim.keymap.set('n', '<leader>fr', ':FzfLua resume<CR>', { desc = 'FzfLua: Resume' })
      vim.keymap.set('n', '<leader>fy', ':FzfLua registers<CR>', { desc = 'FzfLua: Registers' })
    end,
  },
}

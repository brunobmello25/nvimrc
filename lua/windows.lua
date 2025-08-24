require 'lazy-bootstrap'

require('lazy').setup({
  -- Fuzzy finder
  {
    'ibhagwan/fzf-lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'folke/todo-comments.nvim', opts = {} },
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

  -- Grapple for file tagging/bookmarking
  {
    'cbochs/grapple.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    config = function()
      vim.keymap.set('n', '<leader>ha', require('grapple').tag)
      vim.keymap.set('n', '<leader>hh', require('grapple').toggle_tags)

      vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=1<cr>')
      vim.keymap.set('n', '<leader>2', '<cmd>Grapple select index=2<cr>')
      vim.keymap.set('n', '<leader>3', '<cmd>Grapple select index=3<cr>')
      vim.keymap.set('n', '<leader>4', '<cmd>Grapple select index=4<cr>')
      vim.keymap.set('n', '<leader>5', '<cmd>Grapple select index=5<cr>')
      vim.keymap.set('n', '<leader>6', '<cmd>Grapple select index=6<cr>')
      vim.keymap.set('n', '<leader>7', '<cmd>Grapple select index=7<cr>')
      vim.keymap.set('n', '<leader>8', '<cmd>Grapple select index=8<cr>')
      vim.keymap.set('n', '<leader>9', '<cmd>Grapple select index=9<cr>')
    end,
  },

  -- Oil file explorer
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open oil in parent directory' })
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'antosha417/nvim-lsp-file-operations',
    },
  },
}, {
  change_detection = {
    notify = false,
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

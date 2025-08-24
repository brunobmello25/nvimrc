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

  -- Moonfly color scheme
  {
    'bluz71/vim-moonfly-colors',
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.moonflyWinSeparator = 2
      vim.cmd('colorscheme moonfly')
    end,
  },

  -- Flash for enhanced navigation
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  -- Git integration
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', 'gf', '<cmd>diffget //2<CR>', { desc = 'Get left side of diff' })
      vim.keymap.set('n', 'gj', '<cmd>diffget //3<CR>', { desc = 'Get right side of diff' })
    end,
  },

  -- Formatting
  {
    'stevearc/conform.nvim',
    enabled = function()
      local root = vim.fn.getcwd()
      local conform_ignore = vim.fn.glob(root .. '/.conform-ignore', false, true)
      if #conform_ignore > 0 then
        return false
      end
      return true
    end,
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        javascriptreact = { 'prettier' },
        yaml = { 'prettier' },
        html = { 'prettier' },
        htmldjango = { 'prettier' },
        css = { 'prettier' },
        json = { 'jq' },
        python = { 'autopep8' },
        gdscript = { 'gdformat' },
        markdown = { 'markdownlint' },
        sql = { 'sql_formatter' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
      },

      format_on_save = {
        lsp_fallback = true,
      },
    },
    init = function()
      vim.api.nvim_create_user_command('ConformFormat', function()
        require('conform').format()
      end, {})
    end,
  },

  -- Mason for formatter installation
  {
    'williamboman/mason.nvim',
    dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('mason').setup()

      require('mason-tool-installer').setup { 
        ensure_installed = {
          'stylua',
          'prettier',
          'autopep8',
          'clang-format',
          'markdownlint',
          'sql-formatter',
        }
      }
    end,
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

-- Basic keymaps
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

-- Terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })

-- Navigation
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>w', '<C-w>', { desc = 'Window commands' })

-- Visual mode improvements
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
vim.keymap.set('x', 'p', '"_dP', { desc = 'Prevent yank when pasting' })

-- Centered scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })

-- Keep visual selection after indenting
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })

-- Split navigation with Ctrl+arrows
vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Move to down split' })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Move to up split' })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Move to right split' })

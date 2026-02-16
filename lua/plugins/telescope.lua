return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.has 'win32' == 0,
      },
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
      local telescope = require 'telescope'

      telescope.setup {
        pickers = {
          find_files = {
            hidden = false,
            -- Use fd if available for better performance
            find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
          },
          live_grep = {
            -- Additional args for ripgrep to search hidden files
            additional_args = function()
              return { '--hidden', '--glob', '!.git/*' }
            end,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
        defaults = {
          results_title = false,
        },
      }

      if vim.fn.has 'win32' == 0 then
        telescope.load_extension 'fzf'
      end
    end,
    init = function()
      local builtin = require 'telescope.builtin'

      -- File pickers
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files()
      end, { desc = 'Telescope: Find Files' })

      vim.keymap.set('n', '<leader>fF', function()
        builtin.find_files { hidden = true, no_ignore = true }
      end, { desc = 'Telescope: Find Files (Hidden)' })

      vim.keymap.set('n', '<leader>fb', function()
        builtin.buffers()
      end, { desc = 'Telescope: Buffers' })

      vim.keymap.set('n', '<leader>fd', function()
        builtin.diagnostics()
      end, { desc = 'Telescope: Diagnostics' })

      vim.keymap.set('n', '<leader>fg', function()
        builtin.live_grep()
      end, { desc = 'Telescope: Live Grep' })

      vim.keymap.set('n', '<leader>ft', function()
        builtin.grep_string {
          search = [[^\s*((class|interface|type|struct|enum|typedef)\s+|\w+\s*::\s*(struct|enum|union|bit_set|distinct|proc))]],
          use_regex = true,
        }
      end, { desc = 'Telescope: Find Types' })

      vim.keymap.set('n', '<leader>fT', ':TodoTelescope<CR>', { desc = 'Telescope: Todo Comments' })

      vim.keymap.set('n', '<leader>fh', function()
        builtin.help_tags()
      end, { desc = 'Telescope: Help Tags' })

      vim.keymap.set('n', '<leader>fk', function()
        builtin.keymaps()
      end, { desc = 'Telescope: Keymaps' })

      vim.keymap.set('n', '<leader>fr', function()
        builtin.resume()
      end, { desc = 'Telescope: Resume' })

      vim.keymap.set('n', '<leader>fy', function()
        builtin.registers()
      end, { desc = 'Telescope: Registers' })

      -- Additional useful pickers
      vim.keymap.set('n', '<leader>fo', function()
        builtin.oldfiles()
      end, { desc = 'Telescope: Recent Files' })

      vim.keymap.set({ 'n', 'v' }, '<leader>fw', function()
        builtin.grep_string()
      end, { desc = 'Telescope: Grep Word Under Cursor' })

      vim.keymap.set('n', '<leader>fc', function()
        builtin.commands()
      end, { desc = 'Telescope: Commands' })

      vim.keymap.set('n', '<leader>f/', function()
        builtin.current_buffer_fuzzy_find()
      end, { desc = 'Telescope: Fuzzy Find in Current Buffer' })
    end,
  },
}


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
      local actions = require 'telescope.actions'

      telescope.setup {
        defaults = {
          mappings = {
            i = {
              -- Insert mode mappings
              ['<C-u>'] = false, -- Clear prompt instead of scrolling preview
              ['<C-d>'] = false, -- Keep default scroll down
              -- Add paste from register in insert mode (similar to fzf-lua)
              ['<C-r>'] = function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-r>', true, false, true), 'n', false)
              end,
            },
            n = {
              -- Normal mode mappings
              ['q'] = actions.close,
            },
          },
          prompt_prefix = '🔍 ',
          selection_caret = '➜ ',
          path_display = { 'truncate' },
          file_ignore_patterns = {
            'node_modules',
            '.git/',
          },
          layout_config = {
            horizontal = {
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
        },
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
          buffers = {
            sort_mru = true,
            sort_lastused = true,
            mappings = {
              i = {
                ['<c-d>'] = actions.delete_buffer,
              },
            },
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
      }

      -- Load extensions
      telescope.load_extension 'fzf'
    end,
    init = function()
      local builtin = require 'telescope.builtin'

      -- File pickers
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files()
      end, { desc = 'Telescope: Find Files' })

      vim.keymap.set('n', '<leader>fF', function()
        builtin.find_files { hidden = true }
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

      vim.keymap.set('n', '<leader>ft', ':TodoTelescope<CR>', { desc = 'Telescope: Todo Comments' })

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

      vim.keymap.set('n', '<leader>fw', function()
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

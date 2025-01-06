local select_yank_neoclip = function()
  local storage = require 'neoclip.storage'
  local handlers = require 'neoclip.handlers'

  local yanks = storage.get().yanks
  local opts = {
    prompt = 'Yanks: ',
    format_item = function(item)
      return table.concat(item.contents, '\n')
    end,
  }
  local on_choice = function(item, _)
    if item == nil then
      return
    end
    handlers.set_registers({ '"' }, item)
  end
  vim.ui.select(yanks, opts, on_choice)
end

---@diagnostic disable: missing-fields
return {
  {
    'echasnovski/mini.pick',
    version = '*',
    dependencies = {
      {
        'echasnovski/mini.extra',
        version = '*',
        config = function()
          require('mini.extra').setup()
        end,
      },
      'AckslD/nvim-neoclip.lua',
      config = function()
        require('neoclip').setup()
      end,
    },
    config = function()
      local MiniPick = require 'mini.pick'
      MiniPick.setup()
      vim.ui.select = MiniPick.ui_select

      vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>', { desc = '[f]ind [f]iles' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep<CR>', { desc = '[f]ind [g]rep' })
      vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<CR>', { desc = '[f]ind [h]elp' })
      vim.keymap.set('n', '<leader>fr', '<cmd>Pick resume<CR>', { desc = '[f]ind [r]esume' })
      vim.keymap.set('n', '<leader>fd', '<cmd>Pick diagnostic<CR>', { desc = '[f]ind [d]iagnostics' })
      vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<CR>', { desc = '[f]ind [b]uffers' })
      vim.keymap.set('n', '<leader>fk', '<cmd>Pick keymaps<CR>', { desc = '[f]ind [k]eymaps' })
      vim.keymap.set('n', '<leader>fy', select_yank_neoclip, { desc = 'List yanked items' })
      -- vim.keymap.set('n', '<leader>fF', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", { desc = 'Find files (include hidden)' })
      -- vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Search for TODOs' })
    end,
  },
}

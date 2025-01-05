---@diagnostic disable: missing-fields
return {
  {
    'echasnovski/mini.pick',
    version = '*',
    dependencies = { { 'echasnovski/mini.extra', version = '*' } },
    config = function()
      local MiniPick = require 'mini.pick'
      local MiniExtra = require 'mini.extra'
      MiniPick.setup()
      MiniExtra.setup {}
      vim.ui.select = MiniPick.ui_select

      vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>', { desc = '[f]ind [f]iles' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep<CR>', { desc = '[f]ind [g]rep' })
      vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<CR>', { desc = '[f]ind [h]elp' })
      vim.keymap.set('n', '<leader>fr', '<cmd>Pick resume<CR>', { desc = '[f]ind [r]esume' })

      -- vim.keymap.set('n', '<leader>fF', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", { desc = 'Find files (include hidden)' })
      --
      -- vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    end,
  },
}

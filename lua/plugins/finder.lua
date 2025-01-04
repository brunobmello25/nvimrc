---@diagnostic disable: missing-fields
return {
  {
    'echasnovski/mini.pick',
    version = '*',
    config = function()
      require('mini.pick').setup()

      vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>', { desc = '[f]ind [f]iles' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep<CR>', { desc = '[f]ind [g]rep' })
      vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<CR>', { desc = '[f]ind [h]elp' })

      -- vim.keymap.set('n', '<leader>fF', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", { desc = 'Find files (include hidden)' })
      --
      -- vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
      -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    end,
  },
}

return {
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smart-splits').setup {}

      vim.keymap.set('n', '<M-h>', "<cmd>lua require('smart-splits').resize_left()<cr>", { desc = 'Resize left' })
      vim.keymap.set('n', '<M-j>', "<cmd>lua require('smart-splits').resize_down()<cr>", { desc = 'Resize down' })
      vim.keymap.set('n', '<M-k>', "<cmd>lua require('smart-splits').resize_up()<cr>", { desc = 'Resize up' })
      vim.keymap.set('n', '<M-l>', "<cmd>lua require('smart-splits').resize_right()<cr>", { desc = 'Resize right' })

      vim.keymap.set('n', '<C-h>', "<cmd>lua require('smart-splits').move_cursor_left()<cr>", { desc = 'Move left' })
      vim.keymap.set('n', '<C-j>', "<cmd>lua require('smart-splits').move_cursor_down()<cr>", { desc = 'Move down' })
      vim.keymap.set('n', '<C-k>', "<cmd>lua require('smart-splits').move_cursor_up()<cr>", { desc = 'Move up' })
      vim.keymap.set('n', '<C-l>', "<cmd>lua require('smart-splits').move_cursor_right()<cr>", { desc = 'Move right' })

      vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left, { desc = 'Swap left' })
      vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down, { desc = 'Swap down' })
      vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up, { desc = 'Swap up' })
      vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right, { desc = 'Swap right' })
    end,
  },
}

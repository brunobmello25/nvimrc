return {
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
}

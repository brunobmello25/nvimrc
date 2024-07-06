return {
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
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

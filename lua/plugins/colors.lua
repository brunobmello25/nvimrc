_G.UpdateLualine = function()
  local themery = require 'themery'
  local currentTheme = themery.getCurrentTheme()

  require('lualine').setup { options = { theme = currentTheme and currentTheme.name or 'tokyonight' } }
end

return {
  {
    'zaldih/themery.nvim',
    lazy = false,
    priority = 1000,
    dependencies = {
      { 'ellisonleao/gruvbox.nvim' },
      { 'folke/tokyonight.nvim' },
      { 'rose-pine/neovim', name = 'rose-pine' },
      { 'catppuccin/nvim', name = 'catppuccin' },
      { 'Mofiqul/dracula.nvim' },
    },
    config = function()
      require('themery').setup {
        themes = {
          'tokyonight',
          'gruvbox',
          'rose-pine',
          'dracula',
          'dracula-soft',
          'catppuccin-frappe',
          'catppuccin-macchiato',
          'catppuccin-mocha',
          'catppuccin-latte',
        },
        globalAfter = [[print('hello')]],
      }

      vim.keymap.set('n', '<leader>tt', '<cmd>Themery<CR>')
    end,
  },
}

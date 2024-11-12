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
    },
    config = function()
      require('themery').setup {
        themes = { 'tokyonight', 'gruvbox' },
        globalAfter = [[lua UpdateLualine()]],
      }
    end,
  },
}

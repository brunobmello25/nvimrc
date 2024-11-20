return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
      { 'f-person/git-blame.nvim' },
      { 'zaldih/themery.nvim' },
    },
    config = function()
      local themery = require 'themery'
      local currentTheme = themery.getCurrentTheme()

      require('lualine').setup {
        sections = {
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            {
              'filename',
              path = 1,
              symbols = { modified = '  ', readonly = '', unnamed = '' },
            },
          },
          lualine_z = {
            { 'grapple' },
            { 'location', padding = { left = 0, right = 1 } },
          },
        },
        options = {
          theme = currentTheme and currentTheme.name or 'tokyonight',
          icons_enabled = true,
          globalstatus = true,
          disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
          always_divide_middle = true,
        },
      }
    end,
  },
}

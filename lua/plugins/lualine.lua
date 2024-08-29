return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function()
      require('lualine').setup {
        sections = {
          lualine_c = {
            { 'filename', path = 1 },
          },
          lualine_z = {
            { 'grapple' },
            { 'location', padding = { left = 0, right = 1 } },
          },
        },
        options = {
          theme = 'tokyonight',
          icons_enabled = true,
          globalstatus = true,
          disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
          always_divide_middle = true,
        },
      }
    end,
  },
}

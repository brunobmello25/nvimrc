-- _G.UpdateLualine = function()
--   local themery = require 'themery'
--   local currentTheme = themery.getCurrentTheme()
--
--   require('lualine').setup { options = { theme = currentTheme and currentTheme.name or 'tokyonight' } }
-- end

return {
  -- {
  --   'L-Colombo/oldschool.nvim',
  --   config = true,
  --   init = function()
  --     vim.cmd [[colorscheme oldschool]]
  --   end,
  -- },

  {
    'zootedb0t/citruszest.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd [[colorscheme citruszest]]
    end,
  },

  -- {
  --   'zaldih/themery.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   dependencies = {
  --     { 'ellisonleao/gruvbox.nvim' },
  --     { 'folke/tokyonight.nvim' },
  --     { 'rose-pine/neovim', name = 'rose-pine' },
  --     { 'catppuccin/nvim', name = 'catppuccin' },
  --     { 'Mofiqul/dracula.nvim' },
  --     { 'shaunsingh/nord.nvim' },
  --     { 'ishan9299/nvim-solarized-lua' },
  --     { 'navarasu/onedark.nvim' },
  --     { 'EdenEast/nightfox.nvim' },
  --     { 'sainnhe/everforest' },
  --     { 'sainnhe/sonokai' },
  --     { 'sainnhe/edge' },
  --     { 'scottmckendry/cyberdream.nvim' },
  --   },
  --   config = function()
  --     require('themery').setup {
  --       themes = {
  --         'tokyonight',
  --         'cyberdream',
  --         'gruvbox',
  --         'rose-pine',
  --         'dracula',
  --         'dracula-soft',
  --         'nord',
  --         'solarized',
  --         'onedark',
  --         'nightfox',
  --         'catppuccin-frappe',
  --         'catppuccin-macchiato',
  --         'catppuccin-mocha',
  --         'catppuccin-latte',
  --         'everforest',
  --         'sonokai',
  --         'edge',
  --       },
  --       -- globalAfter = [[ _G.UpdateLualine() ]],
  --     }
  --   end,
  -- },
}

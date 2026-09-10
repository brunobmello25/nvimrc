return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = 'light'

      vim.cmd.colorscheme 'solarized'

      vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#20303b' })
      vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#37222c' })
      vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1f2231' })
      vim.api.nvim_set_hl(0, 'DiffText', { bg = '#394b70' })
    end,
  },
  -- moonfly (dark theme, kept around to revert back easily)
  -- {
  --   'bluz71/vim-moonfly-colors',
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.g.moonflyWinSeparator = 2
  --     vim.g.moonflyTransparent = true
  --
  --     vim.cmd.colorscheme 'moonfly'
  --
  --     vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#20303b' })
  --     vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#37222c' })
  --     vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1f2231' })
  --     vim.api.nvim_set_hl(0, 'DiffText', { bg = '#394b70' })
  --   end,
  -- },
}

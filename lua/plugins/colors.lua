return {
  -- {
  --   'maxmx03/solarized.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.o.background = 'light'
  --
  --     vim.cmd.colorscheme 'solarized'
  --
  --     vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#e9f2d3' })
  --     vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#fbe3e2' })
  --     vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#eee8d5' })
  --     vim.api.nvim_set_hl(0, 'DiffText', { bg = '#d6e9ae' })
  --
  --     vim.api.nvim_set_hl(0, 'diffAdded', { fg = '#5f8700' })
  --     vim.api.nvim_set_hl(0, 'diffRemoved', { fg = '#cb4b16' })
  --   end,
  -- },
  -- moonfly (dark theme, kept around to revert back easily)
  {
    'bluz71/vim-moonfly-colors',
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.moonflyWinSeparator = 2
      vim.g.moonflyTransparent = true

      vim.cmd.colorscheme 'moonfly'

      vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#20303b' })
      vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#37222c' })
      vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1f2231' })
      vim.api.nvim_set_hl(0, 'DiffText', { bg = '#394b70' })
    end,
  },
}

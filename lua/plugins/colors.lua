local themes = {
  midnight = {
    source = 'dasupradyumna/midnight.nvim',
    cmd_name = 'midnight',
  },
  cyberdream = {
    source = 'scottmckendry/cyberdream.nvim',
    cmd_name = 'cyberdream',
  },
  ashen = {
    source = 'ficcdaf/ashen.nvim',
    cmd_name = 'ashen',
  },
  moonfly = {
    cmd_name = 'moonfly',
    source = 'bluz71/vim-moonfly-colors',
    before_init = function()
      vim.g.moonflyWinSeparator = 2
      vim.g.moonflyTransparent = true
    end,
  },
  meh = {
    source = 'davidosomething/vim-colors-meh',
    cmd_name = 'meh',
  },
  silentium = {
    source = 'silentium-theme/silentium.nvim',
    cmd_name = 'silentium',
    before_init = function()
      local silentium = require 'silentium'
      silentium.setup { accent = silentium.accents.blue }
    end,
  },
  naysayer = {
    source = 'alljokecake/naysayer-theme.nvim',
    cmd_name = 'naysayer',
    before_init = function()
      require('naysayer').setup {
        variant = 'main',
        dark_variant = 'main',
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
      }
    end,
  },
}
local active_theme = 'moonfly'

local active = themes[active_theme]

local params = {
  active.source,
  lazy = false,
  priority = 1000,
  init = function()
    if themes[active_theme].before_init then
      themes[active_theme].before_init()
    end

    vim.cmd(string.format('colorscheme %s', themes[active_theme].cmd_name))

    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#20303b' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#37222c' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1f2231' })
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#394b70' })

    if themes[active_theme].setup_highlights then
      themes[active_theme].setup_highlights()
    end
  end,
}

return {
  params,
}

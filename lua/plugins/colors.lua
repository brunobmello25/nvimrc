local themes = {
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
}
local active_theme = 'meh'

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

    if themes[active_theme].setup_highlights then
      themes[active_theme].setup_highlights()
    end
  end,
}

return {
  params,
}

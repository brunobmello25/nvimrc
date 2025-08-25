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
    end,
  },
  base16 = {
    source = 'RRethy/base16-nvim',
    cmd_name = 'base16-black-metal-gorgoroth',
    setup_highlights = function()
      vim.api.nvim_set_hl(0, 'DiffAdded', { fg = '#a3be8c', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = '#bf616a', bg = 'NONE' })
    end,
  },
}
local active_theme = 'base16'

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

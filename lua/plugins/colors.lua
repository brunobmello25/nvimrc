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
  },
}
local active_theme = 'moonfly'

local active = themes[active_theme]

local params = {
  active.source,
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd(string.format('colorscheme %s', themes[active_theme].cmd_name))
  end,
}

return {
  params,
}

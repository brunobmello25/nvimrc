local themes = {
  cyberdream = {
    source = 'scottmckendry/cyberdream.nvim',
    cmd_name = 'cyberdream',
  },
  ashen = {
    source = 'ficcdaf/ashen.nvim',
    cmd_name = 'ashen',
  },
}
local active_theme = 'cyberdream'

local active = themes[active_theme]

return {
  {
    active.source,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd(string.format('colorscheme %s', themes[active_theme].cmd_name))
    end,
  },
}

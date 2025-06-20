vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.fn.has 'win32' == 1 then
  require 'windows'
  return
end

vim.g.have_nerd_font = true

require 'utils'
require 'options'
require 'commands'
require 'keymaps'
require 'lazy-bootstrap'
require 'plugins'

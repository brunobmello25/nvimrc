local ensure_installed = { 'bash', 'c', 'diff', 'glsl', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' }

local parsers = require 'nvim-treesitter.parsers'

local highlight_disabled = { csv = true }
local indent_disabled = { ruby = true, c = true, cpp = true }

require('nvim-treesitter').setup {}
require('nvim-treesitter').install(ensure_installed)

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter', { clear = true }),
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(filetype) or filetype

    local has_parser = pcall(vim.treesitter.language.add, lang)
    if not has_parser then
      if parsers[lang] then
        require('nvim-treesitter').install { lang }
      end
      return
    end

    if highlight_disabled[filetype] then
      return
    end

    if not pcall(vim.treesitter.start, args.buf) then
      return
    end

    -- Keep Vim regex highlighting enabled alongside treesitter for ruby.
    if filetype == 'ruby' then
      vim.bo[args.buf].syntax = 'ruby'
    end

    if not indent_disabled[filetype] then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append { fold = ' ' }

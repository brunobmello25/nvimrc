-- nvim-treesitter `main` branch: the `configs` module was removed in the
-- rewrite that targets Neovim 0.12+. Highlighting, indent and folds are now
-- wired here using the APIs built into Neovim itself.

local ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'glsl', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' }

local parsers = require 'nvim-treesitter.parsers'

require('nvim-treesitter').setup {}

-- missing parsers are downloaded/compiled in the background
require('nvim-treesitter').install(ensure_installed)

-- treesitter highlighting is opt-in on the main branch
local highlight_disabled = { csv = true }

-- treesitter indent is still experimental, keep it off where it misbehaves
local indent_disabled = { ruby = true, c = true, cpp = true, csv = true }

vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft) or ft

    -- auto_install replacement: parsers i open files for are installed on demand
    if not highlight_disabled[ft] and parsers[lang] ~= nil and not pcall(vim.treesitter.language.add, lang) then
      require('nvim-treesitter').install { lang }
    end

    if not highlight_disabled[ft] and pcall(vim.treesitter.start, ev.buf) then
      if not indent_disabled[ft] then
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end
  end,
  desc = 'Enable treesitter highlighting/indent',
})

-- incremental selection: nvim-treesitter dropped its implementation in the
-- main branch, Neovim 0.12 ships |vim.treesitter.select()| instead.
vim.keymap.set({ 'n', 'x' }, '<leader><CR>', function()
  vim.treesitter.select 'parent'
end, { desc = 'Treesitter: expand selection' })

vim.keymap.set('x', '<leader><BS>', function()
  vim.treesitter.select 'child'
end, { desc = 'Treesitter: shrink selection' })

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append { fold = ' ' }

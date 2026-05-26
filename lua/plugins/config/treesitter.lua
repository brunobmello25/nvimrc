local ensure_installed = {
  'bash',
  'c',
  'diff',
  'git_rebase',
  'gitattributes',
  'gitignore',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'vim',
  'vimdoc',
  'query',
}

require('nvim-treesitter').install(ensure_installed)

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('nvim-treesitter-start', { clear = true }),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == 'csv' then
      return
    end
    local lang = vim.treesitter.language.get_lang(ft) or ft
    local nts = require 'nvim-treesitter'

    if vim.list_contains(nts.get_installed 'parsers', lang) then
      pcall(vim.treesitter.start, args.buf, lang)
      if ft ~= 'ruby' and ft ~= 'c' and ft ~= 'cpp' then
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    elseif vim.list_contains(nts.get_available(), lang) then
      vim.schedule(function()
        nts.install { lang }
      end)
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

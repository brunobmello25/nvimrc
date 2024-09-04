return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    {
      'kristijanhusak/vim-dadbod-completion',
      config = function()
        require('cmp').setup.filetype({ 'sql', 'mysql', 'plsql' }, {
          sources = {
            { name = 'vim-dadbod-completion' },
            { name = 'buffer' },
          },
        })
      end,
    },
  },
}

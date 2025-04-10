return {
  {
    'danymat/neogen',
    config = true,
    init = function()
      vim.api.nvim_create_user_command('GenerateCommentDoc', function(opts)
        require('neogen').generate({ range = opts.range })
      end, { range = true })
    end,
  },
}

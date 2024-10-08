require('gitgraph').setup {
  symbols = {
    merge_commit = 'M',
    commit = '*',
  },
  format = {
    timestamp = '%H:%M:%S %d-%m-%Y',
    fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
  },
  hooks = {

    on_select_commit = function(commit)
      vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
    end,
    -- Check diff from commit a -> commit b
    on_select_range_commit = function(from, to)
      vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
    end,
  },
}

vim.api.nvim_create_user_command('GitGraph', function()
  vim.cmd 'tabnew'
  require('gitgraph').draw({}, { all = true, max_count = 5000 })
end, {})

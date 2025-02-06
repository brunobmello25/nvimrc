return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      picker = {
        enabled = true,
      },
    },
    dependencies = {
      {
        'folke/todo-comments.nvim',
        config = true,
      },
    },
    -- TODO:
    -- list yanked items
    -- customize grep with ctrl+space
    keys = {
      {
        '<leader>ff',
        function()
          Snacks.picker.files()
        end,
      },
      {
        '<leader>fF',
        function()
          Snacks.picker.files { hidden = true }
        end,
      },
      {
        '<leader>fb',
        function()
          Snacks.picker.buffers()
        end,
      },
      {
        '<leader>fd',
        function()
          Snacks.picker.diagnostics()
        end,
      },
      {
        '<leader>fg',
        function()
          Snacks.picker.grep()
        end,
      },
      {
        '<leader>ft',
        function()
          Snacks.picker.todo_comments()
        end,
        desc = 'Todo',
      },
      {
        '<leader>fh',
        function()
          Snacks.picker.help()
        end,
      },
      {
        '<leader>fk',
        function()
          Snacks.picker.keymaps()
        end,
      },
      {
        '<leader>fr',
        function()
          Snacks.picker.resume()
        end,
      },
    },
  },
}

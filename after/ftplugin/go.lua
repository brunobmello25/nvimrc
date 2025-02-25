vim.keymap.set('n', '<leader>dt', function()
  require('dap-go').debug_test()
end, { desc = 'Debug local test' })

local function highlight_go_tags()
  local bufnr = vim.api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr, 'go')
  local tree = parser:parse()[1]
  local root = tree:root()

  local queryContent = [[
    (field_declaration
      tag: (raw_string_literal (raw_string_literal_content) @tag.content)
    )
  ]]
  local query = vim.treesitter.query.parse(
    'go',
    queryContent
  )

  for id, node in query:iter_captures(root, bufnr, 0, -1) do
    local name = query.captures[id]
    if name == 'tag.content' then
      local text = vim.treesitter.get_node_text(node, bufnr)
      -- Now process the text to find keys like "json", "validate", "query"
      for key in text:gmatch '%s*([%w_]+)%s-:%s-' do
        -- Highlight operations using Neovim APIs, e.g., nvim_buf_add_highlight
        local start_row, start_col, _, _ = node:range()

        -- For demonstration, identify the range offset for each key within the text
        local start = text:find(key)
        if start then
          local key_end = start + #key
          -- Convert this relative position to a full buffer range
          vim.api.nvim_buf_add_highlight(
            bufnr,
            -1, -- Your highlight namespace or -1 for new
            'Identifier', -- Assume this or create your linked group
            start_row,
            start_col + start - 1,
            start_col + key_end - 1
          )
        end
      end
    end
  end
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'InsertLeave' }, {
  pattern = '*.go',
  callback = highlight_go_tags,
})

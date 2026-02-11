return {
  {
    'stevearc/conform.nvim',
    enabled = function()
      -- return false if the current directory root has a .conform-ignore file

      local root = vim.fn.getcwd()
      local conform_ignore = vim.fn.glob(root .. '/.conform-ignore', false, true)
      if #conform_ignore > 0 then
        return false
      end
      return true
    end,
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        javascriptreact = { 'prettier' },
        yaml = { 'prettier' },
        html = { 'prettier' },
        htmldjango = { 'prettier' },
        css = { 'prettier' },
        json = { 'jq' },
        python = { 'autopep8' },
        gdscript = { 'gdformat' },
        markdown = { 'markdownlint' },
        sql = { 'sql_formatter' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
      },

      format_on_save = {
        lsp_fallback = true,
      },
    },
    init = function()
      vim.api.nvim_create_user_command('FormatDocument', function()
        require('conform').format()
      end, {})

      vim.api.nvim_create_user_command('ConformFormat', function()
        require('conform').format()
      end, {})
    end,
  },
}

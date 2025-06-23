return {
  {
    'stevearc/conform.nvim',
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
      vim.api.nvim_create_user_command('ConformFormat', function()
        require('conform').format()
      end, {})
    end,
  },
}

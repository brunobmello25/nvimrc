return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },

        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettier', 'prettierd' } },
        typescriptreact = { { 'prettier', 'prettierd' } },
        javascriptreact = { { 'prettier', 'prettierd' } },
        yaml = { 'prettier', 'prettierd' },
        html = { 'prettier', 'prettierd' },
        css = { 'prettier', 'prettierd' },

        json = { 'jq' },

        python = { 'autopep8' },

        gdscript = { 'gdformat' },

        markdown = { 'markdownlint' },
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

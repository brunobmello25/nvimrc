return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      local goci = lint.linters.golangcilint
      goci.args = { 'run', '--output.json.path=stdout', '--show-stats=false', '--issues-exit-code', '0' }

      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft['typescript'] = { 'eslint' }
      lint.linters_by_ft['javascript'] = { 'eslint' }
      lint.linters_by_ft['typescriptreact'] = { 'eslint' }
      lint.linters_by_ft['javascriptreact'] = { 'eslint' }
      lint.linters_by_ft['yaml'] = { 'yamllint' }
      lint.linters_by_ft['go'] = { 'golangcilint' }

      local disabled = { 'terraform', 'ruby', 'rst', 'markdown', 'janet', 'inko', 'dockerfile', 'clojure', 'text', 'markdown' }
      for _, linter in ipairs(disabled) do
        lint.linters_by_ft[linter] = nil
      end

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}

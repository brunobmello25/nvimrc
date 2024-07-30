local client = vim.lsp.start_client {
  name = 'educationalsp',
  cmd = { '/Users/bruno.mello/dev/personal/educationalsp/main' },
  on_attach = require('plugins.config.lsp.on_attach').on_attach,
}

if not client then
  vim.notify 'Failed to start educationalsp'
  return
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.lsp.buf_attach_client(0, client)
  end,
})

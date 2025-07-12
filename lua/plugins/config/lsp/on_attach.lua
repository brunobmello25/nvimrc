local M = {}

function M.on_attach(client, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  map('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
  map('gr', vim.lsp.buf.references, '[g]oto [r]eferences')
  map('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
  map('gT', vim.lsp.buf.type_definition, '[g]oto [T]ype definition')
  map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
  map('<leader>.', vim.lsp.buf.code_action, 'Code Action')
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')

  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    end, '[T]oggle Inlay [H]ints')
  end
end

return M

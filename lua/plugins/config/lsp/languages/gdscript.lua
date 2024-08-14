local on_attach = require('plugins.config.lsp.on_attach').on_attach

require('lspconfig').gdscript.setup {
  cmd = { 'ncat', 'localhost', os.getenv 'GDScript_Port' or '6005' },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
  single_file_support = false,
}

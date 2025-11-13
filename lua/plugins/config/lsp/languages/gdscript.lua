vim.lsp.config.gdscript = {
  cmd = { 'ncat', 'localhost', os.getenv 'GDScript_Port' or '6005' },
  root_markers = { 'project.godot', '.git' },
  single_file_support = false,
  filetypes = { 'gdscript' },
}

vim.lsp.enable 'gdscript'

local function root_pattern(...)
  local patterns = { ... }
  return function(path)
    return vim.fs.find(patterns, { path = path, upward = true })[1]
  end
end

vim.lsp.config.gdscript = {
  cmd = { 'ncat', 'localhost', os.getenv 'GDScript_Port' or '6005' },
  root_dir = root_pattern('project.godot', '.git'),
  single_file_support = false,
  filetypes = { 'gdscript' },
}

vim.lsp.enable 'gdscript'

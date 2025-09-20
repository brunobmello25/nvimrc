P = function(v)
  print(vim.inspect(v))
  return v
end

local function load_project_config()
  local cwd = vim.fn.getcwd()
  local project_config_path = cwd .. '/.nvimrc/init.lua'
  
  if vim.fn.filereadable(project_config_path) == 1 then
    local success, err = pcall(dofile, project_config_path)
    if success then
      vim.notify('Loaded project config: ' .. project_config_path, vim.log.levels.INFO)
    else
      vim.notify('Error loading project config: ' .. err, vim.log.levels.ERROR)
    end
  end
end

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Load project-specific configuration',
  callback = load_project_config,
})

vim.api.nvim_create_autocmd('DirChanged', {
  desc = 'Load project-specific configuration when changing directories',
  callback = load_project_config,
})

local M = {}

M.addons_dir = vim.fn.stdpath 'data' .. '/LuaAddons'

local love2d_dir = M.addons_dir .. '/love2d'

local function ensure_love2d()
  if vim.fn.isdirectory(M.addons_dir) == 0 then
    vim.fn.mkdir(M.addons_dir, 'p')
  end

  if vim.fn.isdirectory(love2d_dir) == 0 then
    vim.fn.system(string.format('git clone https://github.com/LuaCATS/love2d.git %s', love2d_dir))
  end
end

ensure_love2d()

return M

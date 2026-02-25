local cache_file = vim.fn.expand '~/.cache/dap/breakpoints.json'

local function read_cache()
  local fp = io.open(cache_file, 'r')
  if not fp then
    return {}
  end
  local raw = fp:read '*a'
  fp:close()
  if raw == '' then
    return {}
  end
  return vim.fn.json_decode(raw) or {}
end

local function write_cache(bps)
  vim.fn.mkdir(vim.fn.fnamemodify(cache_file, ':h'), 'p')
  local fp = io.open(cache_file, 'w')
  if not fp then
    return
  end
  fp:write(vim.fn.json_encode(bps))
  fp:close()
end

local function store_breakpoints()
  local bps = read_cache()
  local dap_bps = require('dap.breakpoints').get()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local path = vim.api.nvim_buf_get_name(bufnr)
    if path ~= '' then
      bps[path] = dap_bps[bufnr] or {}
    end
  end
  write_cache(bps)
end

local function load_breakpoints()
  local bps = read_cache()
  local loaded_buffers = {}
  local found = false
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local path = vim.api.nvim_buf_get_name(bufnr)
    if bps[path] ~= nil and next(bps[path]) ~= nil then
      found = true
    end
    loaded_buffers[path] = bufnr
  end
  if not found then
    return
  end
  local dap_bp = require 'dap.breakpoints'
  for path, buf_bps in pairs(bps) do
    for _, bp in pairs(buf_bps) do
      dap_bp.set({
        condition = bp.condition,
        log_message = bp.logMessage,
        hit_condition = bp.hitCondition,
      }, tonumber(loaded_buffers[path]), bp.line)
    end
  end
end

vim.api.nvim_create_autocmd('BufRead', {
  callback = load_breakpoints,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = store_breakpoints,
})

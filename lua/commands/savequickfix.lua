local function convert_bfnumbers_to_paths(qflist)
  for _, entry in ipairs(qflist) do
    local bufnr = entry.bufnr
    local path = vim.api.nvim_buf_get_name(bufnr)
    entry.filepath = path
    entry.bufnr = nil
  end

  return qflist
end

local function convert_filepaths_to_bfnumbers(qflist)
  for _, entry in ipairs(qflist) do
    local path = entry.filepath
    local bufnr = vim.fn.bufadd(path)
    entry.bufnr = bufnr
    entry.filepath = nil
  end

  return qflist
end

local function save_quickfix(filepath)
  local qflist = vim.fn.getqflist()
  qflist = convert_bfnumbers_to_paths(qflist)
  local json = vim.fn.json_encode(qflist)
  local file, err = io.open(filepath, 'w')
  if not file then
    vim.notify('Error opening file for writing: ' .. err, vim.log.levels.ERROR)
    return
  end
  file:write(json)
  file:close()
  vim.notify('Quickfix list saved to ' .. filepath, vim.log.levels.INFO)
end

local function load_quickfix(filepath)
  local file, err = io.open(filepath, 'r')
  if not file then
    vim.notify('Error opening file for reading: ' .. err, vim.log.levels.ERROR)
    return
  end
  local json = file:read '*a'
  file:close()
  local qflist = vim.fn.json_decode(json)
  qflist = convert_filepaths_to_bfnumbers(qflist)
  if qflist then
    vim.fn.setqflist(qflist)
    vim.cmd 'copen'
    vim.notify('Quickfix list loaded from ' .. filepath, vim.log.levels.INFO)
  else
    vim.notify('Failed to decode quickfix list from JSON.', vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command('SaveQuickfix', function(opts)
  local filepath = opts.args
  if filepath == '' then
    vim.notify('Usage: :SaveQuickfix <filepath>', vim.log.levels.WARN)
    return
  end
  save_quickfix(filepath)
end, { nargs = 1, desc = 'Save the current quickfix list to a file' })

vim.api.nvim_create_user_command('LoadQuickfix', function(opts)
  local filepath = opts.args
  if filepath == '' then
    vim.notify('Usage: :LoadQuickfix <filepath>', vim.log.levels.WARN)
    return
  end
  load_quickfix(filepath)
end, { nargs = 1, desc = 'Load a quickfix list from a file' })

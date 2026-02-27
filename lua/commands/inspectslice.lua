local function parse_gdb_array(result)
  -- strip outer braces and the "$n = " prefix
  local inner = result:match('%b{}'):sub(2, -2)
  local lines = {}
  local idx = 0

  for token in (inner .. ','):gmatch '([^,]+),' do
    token = token:match '^%s*(.-)%s*$'
    local val, count = token:match '^(0x%x+)%s+<repeats%s+(%d+)%s+times>'
    if val and count then
      for _ = 1, tonumber(count) do
        table.insert(lines, string.format('[%d] %s', idx, val))
        idx = idx + 1
      end
    elseif token ~= '' then
      table.insert(lines, string.format('[%d] %s', idx, token))
      idx = idx + 1
    end
  end

  return lines
end

vim.api.nvim_create_user_command('InspectSlice', function(opts)
  local args = vim.split(opts.args, ' ')
  local var = args[1] or vim.fn.expand '<cword>'
  local count = tonumber(args[2]) or 20

  local session = require('dap').session()
  if not session then
    vim.notify('No active DAP session', vim.log.levels.ERROR)
    return
  end

  local frame_id = nil
  if session.current_frame then
    frame_id = session.current_frame.id
  end

  local expr = string.format('print/x *(%s.data)@%d', var, count)
  session:request('evaluate', {
    expression = expr,
    context = 'repl',
    frameId = frame_id,
  }, function(err, resp)
    if err then
      vim.notify('Error: ' .. vim.inspect(err), vim.log.levels.ERROR)
      return
    end

    local lines = parse_gdb_array(resp.result)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].filetype = 'gdb'

    local width = math.floor(vim.o.columns * 0.6)
    local height = math.min(#lines, math.floor(vim.o.lines * 0.8))
    vim.api.nvim_open_win(buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      col = math.floor((vim.o.columns - width) / 2),
      row = math.floor((vim.o.lines - height) / 2),
      style = 'minimal',
      border = 'rounded',
      title = string.format(' %s (%d elements) ', var, count),
      title_pos = 'center',
    })

    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = buf, silent = true })
  end)
end, {
  nargs = '*',
  desc = 'Inspect an Odin slice in a floating window',
})

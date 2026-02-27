local function parse_gdb_array(result)
  local inner = result:match('%b{}'):sub(2, -2)
  local lines = {}
  local idx = 0

  local tokens = {}
  local depth, in_string, current = 0, false, ''
  for i = 1, #inner do
    local c = inner:sub(i, i)
    if c == '"' then
      in_string = not in_string
      current = current .. c
    elseif not in_string and (c == '{' or c == '(') then
      depth = depth + 1
      current = current .. c
    elseif not in_string and (c == '}' or c == ')') then
      depth = depth - 1
      current = current .. c
    elseif not in_string and depth == 0 and c == ',' then
      table.insert(tokens, current:match '^%s*(.-)%s*$')
      current = ''
    else
      current = current .. c
    end
  end
  if current:match '%S' then
    table.insert(tokens, current:match '^%s*(.-)%s*$')
  end

  for _, token in ipairs(tokens) do
    local val, rep = token:match '^(.+)%s+<repeats%s+(%d+)%s+times>'
    if val and rep then
      val = val:match '^%s*(.-)%s*$'
      for _ = 1, tonumber(rep) do
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
  local fmt = args[3]

  local session = require('dap').session()
  if not session then
    vim.notify('No active DAP session', vim.log.levels.ERROR)
    return
  end

  local frame_id = nil
  if session.current_frame then
    frame_id = session.current_frame.id
  end

  local expr
  if fmt then
    expr = string.format('print/%s *(%s.data)@%d', fmt, var, count)
  else
    expr = string.format('print *(%s.data)@%d', var, count)
  end

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
    local title = fmt and string.format(' %s (%d elements) [/%s] ', var, count, fmt) or string.format(' %s (%d elements) ', var, count)

    vim.api.nvim_open_win(buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      col = math.floor((vim.o.columns - width) / 2),
      row = math.floor((vim.o.lines - height) / 2),
      style = 'minimal',
      border = 'rounded',
      title = title,
      title_pos = 'center',
    })

    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = buf, silent = true })
  end)
end, {
  nargs = '*',
  desc = 'Inspect an Odin slice. Usage: InspectSlice <var> [count] [format: x|d|f|o|t|c]',
})

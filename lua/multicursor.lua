local ns = vim.api.nvim_create_namespace 'nvim.multicursor'
local state = { bufnr = nil, word = nil, primary = nil, last = nil }

local function pos_key(pos)
  return ('%d:%d'):format(pos[1], pos[2])
end

local function pos_lt(a, b)
  return a[1] < b[1] or (a[1] == b[1] and a[2] < b[2])
end

local function clear()
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  state = { bufnr = nil, word = nil, primary = nil, last = nil }
end

local function add_next()
  local buf = vim.api.nvim_get_current_buf()
  local word = vim.fn.expand '<cword>'
  local on_keyword = vim.fn.matchstr(vim.fn.getline '.', '\\%' .. vim.fn.col '.' .. 'c\\k') ~= ''

  -- Preserve normal-mode <C-n> behavior when not on a word.
  if word == '' or not on_keyword then
    vim.api.nvim_feedkeys(vim.keycode '<C-n>', 'n', false)
    return
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local primary = { cursor[1] - 1, cursor[2] }
  local new_sequence = state.bufnr ~= buf or state.word ~= word or not vim.deep_equal(state.primary, primary)

  if new_sequence then
    state = { bufnr = buf, word = word, primary = primary, last = nil }
  end

  local pattern = '\\V\\<' .. vim.fn.escape(word, '\\') .. '\\>'
  local matches = vim.fn.matchbufline(buf, pattern, 1, '$')

  -- Keep every cursor at the same offset inside the word as the primary cursor.
  local primary_word_start
  for _, match in ipairs(matches) do
    if match.lnum - 1 == primary[1] and match.byteidx <= primary[2] and primary[2] < match.byteidx + #word then
      primary_word_start = { match.lnum - 1, match.byteidx }
      break
    end
  end

  local offset = primary_word_start and (primary[2] - primary_word_start[2]) or 0
  if new_sequence then
    state.last = primary_word_start or primary
  end

  local occupied = { [pos_key(primary)] = true }
  for _, mark in ipairs(vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})) do
    occupied[pos_key { mark[2], mark[3] }] = true
  end

  local next_pos, next_search_pos
  for _, match in ipairs(matches) do
    local search_pos = { match.lnum - 1, match.byteidx }
    local pos = { search_pos[1], search_pos[2] + offset }
    if not occupied[pos_key(pos)] and pos_lt(state.last, search_pos) then
      next_pos = pos
      next_search_pos = search_pos
      break
    end
  end

  if not next_pos then
    vim.notify(('No more occurrences of %q'):format(word), vim.log.levels.INFO)
    return
  end

  -- Move focus to the newest cursor, keeping the old primary as a multicursor.
  vim.api.nvim_buf_set_extmark(buf, ns, primary[1], primary[2], {})
  vim.api.nvim_win_set_cursor(0, { next_pos[1] + 1, next_pos[2] })
  state.primary = next_pos
  state.last = next_search_pos
end

vim.keymap.set('n', '<C-n>', add_next, { desc = 'Add cursor at next occurrence' })
vim.keymap.set('n', '<C-S-l>', clear, { desc = 'Clear multicursors' })

-- Double <Esc> clears all multicursors in the current buffer.
local last_esc_at = 0
vim.on_key(function(key)
  if vim.fn.keytrans(key) == '<Esc>' then
    local now = vim.uv.hrtime()
    if now - last_esc_at <= 300 * 1e6 then
      last_esc_at = 0
      vim.schedule(clear)
    else
      last_esc_at = now
    end
  else
    last_esc_at = 0
  end
end, vim.api.nvim_create_namespace 'double-esc-clear-multicursors')

return { add_next = add_next, clear = clear }

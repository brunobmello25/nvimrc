local M = {}

---Wrap the current line or command range with the given text.
---@param before string Text inserted before the wrapped lines.
---@param after string Text inserted after the wrapped lines.
---@param opts { range: integer, line1: integer, line2: integer }|nil Command options used to determine the range.
function M.wrap_with(before, after, opts)
  local buf = vim.api.nvim_get_current_buf()
  local has_range = opts and opts.range > 0
  local start = has_range and opts.line1 or vim.fn.line '.'
  local stop = has_range and opts.line2 or start

  vim.api.nvim_buf_set_lines(buf, stop, stop, false, { after })
  vim.api.nvim_buf_set_lines(buf, start - 1, start - 1, false, { before })
end

return M

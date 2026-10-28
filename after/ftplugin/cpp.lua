local wrap_with = require('commands.wrap_with').wrap_with

---Wrap the current line or selection with an `#if 0`/`#endif` block.
---@param opts { range: integer, line1: integer, line2: integer } Command options containing the target range.
local function ifzero(opts)
  wrap_with('#if 0', '#endif', opts)
end

vim.api.nvim_buf_create_user_command(0, 'Ifzero', ifzero, {
  range = true,
  force = true,
  desc = 'Wrap lines with #if 0/#endif',
})

vim.keymap.set('v', '<leader>iz', ':Ifzero<CR>', {})

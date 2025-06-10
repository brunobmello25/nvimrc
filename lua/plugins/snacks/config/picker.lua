return {
  enabled = true,
  formatters = {
    file = {
      truncate = 80,
    },
  },
  sources = {
    registers = {
      confirm = {
        action = { 'yank', 'close' },
        source = 'registers',
        notify = false,
      },
    },
  },
}

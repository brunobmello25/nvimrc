return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {
        backend = 'kitty',
        integrations = {
          markdown = { enabled = true },
        },
      },
      terminal = {},
    },
  },
}

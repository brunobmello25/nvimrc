return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = {
        doc = {

          max_width = 30,
          max_height = 30,
          inline = false,
          float = false,
        },
      },
      terminal = {},
    },
  },
}

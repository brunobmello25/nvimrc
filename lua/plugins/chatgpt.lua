return {
  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
      require 'plugins.config.chatgpt'
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
}

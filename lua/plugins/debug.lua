return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',

      'nvim-neotest/nvim-nio',

      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- 'leoluz/nvim-dap-go',
      'CruelAddict/nvim-dap-go',
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      require 'plugins.config.debug'
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter' },
    opts = {
      virt_text_pos = 'eol',
    },
  },
}

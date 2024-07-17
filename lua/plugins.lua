require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- clear search highlight after cursor movement
  { 'romainl/vim-cool' },

  { 'kevinhwang91/nvim-bqf', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  require 'plugins.flash',
  require 'plugins.git',
  require 'plugins.telescope',
  require 'plugins.lspconfig',
  require 'plugins.conform',
  require 'plugins.cmp',
  require 'plugins.colors',
  require 'plugins.lualine',
  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.harpoon',
  require 'plugins.autopairs',
  require 'plugins.debug',
  require 'plugins.lint',
  require 'plugins.smartsplits',
  require 'plugins.oil',
  require 'plugins.copilot',
  require 'plugins.zenmode',
  require 'plugins.chatgpt',
}, {
  change_detection = {
    notify = false,
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

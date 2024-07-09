require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- clear search highlight after cursor movement
  { 'romainl/vim-cool' },

  { 'kevinhwang91/nvim-bqf', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  require 'bruno/plugins/flash',
  require 'bruno/plugins/gitsigns',
  require 'bruno/plugins/fugitive',
  require 'bruno/plugins/telescope',
  require 'bruno/plugins/lspconfig',
  require 'bruno/plugins/conform',
  require 'bruno/plugins/cmp',
  require 'bruno/plugins/tokyonight',
  require 'bruno/plugins/lualine',
  require 'bruno/plugins/mini',
  require 'bruno/plugins/treesitter',
  require 'bruno/plugins/harpoon',
  require 'bruno/plugins/autopairs',
  require 'bruno/plugins/debug',
  require 'bruno/plugins/lint',
  require 'bruno/plugins/smartsplits',
  require 'bruno/plugins/oil',
  require 'bruno/plugins/copilot',
  -- require 'bruno/plugins/neo-tree',
  -- require 'bruno/plugins/indent_line',
}, {
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

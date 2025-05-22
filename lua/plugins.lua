require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- { 'romainl/vim-cool' }, -- clear search highlight after cursor movement

  { 'kevinhwang91/nvim-bqf', dependencies = { 'nvim-treesitter/nvim-treesitter' } }, -- better quickfix window experience (preview, filter items etc)

  { 'aklt/plantuml-syntax' },

  { 'chentoast/marks.nvim', event = 'VeryLazy', opts = {} },

  require 'plugins.neogen',
  require 'plugins.persist-quickfix',
  require 'plugins.csv',
  require 'plugins.comment', -- "gc" to comment visual regions/lines
  require 'plugins.flash', -- code navigation with "s" key
  require 'plugins.git', -- git plugins
  require 'plugins.pick', -- picker with snacks.picker
  require 'plugins.lspconfig', -- lsp stuff
  require 'plugins.conform', -- formatting config
  require 'plugins.completion', -- completion
  require 'plugins.colors', -- color theme
  require 'plugins.lualine', -- status bar
  require 'plugins.surround', -- change surround objects (quotes, brackets etc)
  require 'plugins.treesitter',
  require 'plugins.grapple', -- "favorite" file navigation
  require 'plugins.autopairs', -- auto write closing brackets, quotes etc
  require 'plugins.autotags', -- autoclose tags like html, xml etc
  require 'plugins.debug', -- debug config
  require 'plugins.lint', -- lint config
  require 'plugins.smartsplits', -- better handling of vertical and horizontal splits, and tmux integration
  require 'plugins.oil', -- my file manager of choice
  require 'plugins.zenmode', -- I use this to be able to maximize a specific buffer
  require 'plugins.database', -- database config, similar to datagrip
  require 'plugins.gitgraph', -- git graph
  require 'plugins.tailwind', -- tailwind css
  require 'plugins.undotree', -- undo tree

  require 'plugins.copilot', -- github copilot
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

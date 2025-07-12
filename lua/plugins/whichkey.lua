return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    
    wk.add({
      -- Global keys
      { "<C-d>", desc = "Scroll Down" },
      { "<C-f>", desc = "Tmux Sessionizer" },
      { "<C-u>", desc = "Scroll Up" },

      -- Diagnostic navigation
      { "[d", desc = "Previous diagnostic" },
      { "[e", desc = "Previous error" },
      { "[q", desc = "Previous quickfix item" },
      { "]d", desc = "Next diagnostic" },
      { "]e", desc = "Next error" },
      { "]q", desc = "Next quickfix item" },

      -- Leader key groups and mappings
      { "<leader>Q", desc = "Close Tab" },
      { "<leader>q", desc = "Quit" },
      { "<leader>w", desc = "Window Commands" },
      { "<leader>y", desc = "Yank to Clipboard" },
      { "<leader>x", desc = "Execute Current File" },
      { "<leader>m", desc = "Mark Navigation" },

      -- Find group
      { "<leader>f", group = "Find" },
      { "<leader>ff", desc = "Find Files" },
      { "<leader>fF", desc = "Find Files (Full)" },
      { "<leader>fb", desc = "Find Buffers" },
      { "<leader>fd", desc = "Find in Directory" },
      { "<leader>fg", desc = "Find in Git" },
      { "<leader>ft", desc = "Find Tags" },
      { "<leader>fh", desc = "Find Help" },
      { "<leader>fk", desc = "Find Keymaps" },
      { "<leader>fr", desc = "Find Recent" },
      { "<leader>fy", desc = "Find Yanks" },

      -- Debug group
      { "<leader>d", group = "Debug" },
      { "<leader>dt", desc = "Debug Test" },
      { "<leader>dr", desc = "Debug Run" },
      { "<leader>du", desc = "Toggle Debug UI" },
      { "<leader>de", desc = "Debug Eval" },
      { "<leader>db", desc = "Toggle Breakpoint" },

      -- Grapple group
      { "<leader>h", group = "Grapple" },
      { "<leader>ha", desc = "Tag File" },
      { "<leader>hh", desc = "Toggle Tags" },

      -- Toggles
      { "<leader>tw", desc = "Toggle Wrap" },

      -- Quickfix
      { "<leader>sq", desc = "Save Quickfix" },
      { "<leader>lq", desc = "Load Quickfix" },

      -- Relative line numbers
      { "<leader>rln", desc = "Toggle Relative Line Numbers" }
    })
  end
}
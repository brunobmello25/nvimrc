return {
  'carlos-algms/agentic.nvim',
  event = 'VeryLazy',

  opts = {
    -- Available by default: "claude-acp" | "gemini-acp" | "codex-acp" | "opencode-acp"
    provider = 'opencode-acp', -- setting the name here is all you need to get started
  },
  keys = {
    {
      '<leader>ai',
      function()
        require('agentic').toggle()
      end,
      mode = { 'n', 'v' },
      desc = 'toggle agentic chat',
    },

    {
      '<leader>aa',
      function()
        require('agentic').add_selection_or_file_to_context()
      end,
      mode = { 'n', 'v' },
      desc = 'Add file or selection to Agentic to Context',
    },

    {
      '<leader>an',
      function()
        require('agentic').new_session()
      end,
      mode = { 'n', 'v' },
      desc = 'New Agentic Session',
    },
  },
}

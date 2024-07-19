require('chatgpt').setup {
  openai_params = {
    model = function()
      return 'gpt-4o-mini'
    end,
  },
}

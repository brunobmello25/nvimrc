local MODELS = {
  ['gpt-4o-mini'] = 'gpt-4o-mini',
  ['gpt-4o'] = 'gpt-4o',
}

vim.g.chatgpt_model = 'gpt-4o-mini'

vim.api.nvim_create_user_command('ChatGPTChangeModel', function(params)
  local model = vim.trim(params.args)

  assert(model, 'No model provided')
  vim.g.chatgpt_model = model
end, {
  nargs = 1,
  complete = function()
    return vim.tbl_values(MODELS)
  end,
})

require('chatgpt').setup {
  openai_params = {
    model = function()
      return vim.g.chatgpt_model
    end,
  },
}

return {
  'HakonHarnes/img-clip.nvim',
  event = 'VeryLazy',
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  init = function()
    vim.api.nvim_create_user_command('PasteImageBase64', function()
      require('img-clip').paste_image { embed_image_as_base64 = true }
    end, {})
  end,
}

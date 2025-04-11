---@diagnostic disable: missing-fields
return {
  {
    'saghen/blink.cmp',
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

    version = 'v0.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
        ['<Tab>'] = {},
        ['<S-Tab>'] = {},
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      snippets = {
        preset = 'luasnip',
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          cmdline = {
            -- TODO: maybe switch this back on?
            enabled = false,
          },
        },
      },

      signature = { enabled = true },
    },
  },
}

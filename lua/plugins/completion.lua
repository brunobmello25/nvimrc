---@diagnostic disable: missing-fields
return {
  {
    'saghen/blink.cmp',
    dependencies = { 'folke/lazydev.nvim', 'L3MON4D3/LuaSnip', version = 'v2.*' },

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
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      cmdline = {
        enabled = false,
      },

      signature = { enabled = true },
    },
  },
}

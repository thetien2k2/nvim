return {
  "saghen/blink.cmp",
  event = "VeryLazy",
  version = '*',
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {},
      ["<S-Tab>"] = {},
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-j>"] = { "snippet_backward", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      -- accept = {
      --   auto_brackets = {
      --     enabled = true,
      --   },
      -- },
    },
    snippets = {
      expand = function(snippet) vim.snippet.expand(snippet) end,
      active = function(filter) return vim.snippet.active(filter) end,
      jump = function(direction) vim.snippet.jump(direction) end,
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" },
}

return {
  "saghen/blink.cmp",
  version = "*",
  enabled = true,
  event = "VeryLazy",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {},
      ["<S-Tab>"] = {},
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-j>"] = { "snippet_backward", "fallback" },
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
    },
    signature = {
      enabled = true
    },
    snippets = {
      -- expand = function(snippet)
      --   require("luasnip").lsp_expand(snippet)
      -- end,
      -- active = function(filter)
      --   if filter and filter.direction then
      --     return require("luasnip").jumpable(filter.direction)
      --   end
      --   return require("luasnip").in_snippet()
      -- end,
      -- jump = function(direction)
      --   require("luasnip").jump(direction)
      -- end,
      expand = function(snippet) vim.snippet.expand(snippet) end,
      active = function(filter) return vim.snippet.active(filter) end,
      jump = function(direction) vim.snippet.jump(direction) end,
    },
    sources = {
      -- default = { "lsp", "path", "luasnip", "buffer" },
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" },
}
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  -- cmd = { "ConformInfo" },
  -- keys = "<leader>a",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gopls" },
      angular = { "prettier" },
      css = { "prettier" },
      flow = { "prettier" },
      graphql = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsx = { "prettier" },
      javascript = { "prettier" },
      less = { "prettier" },
      markdown = { "prettier" },
      scss = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      yaml = { "prettier" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_format = "fallback",
    -- },
  },
}

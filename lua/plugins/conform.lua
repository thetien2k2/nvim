---@diagnostic disable: undefined-global
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofmt" },
      -- gotmpl = { "prettier" },
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
  },
}

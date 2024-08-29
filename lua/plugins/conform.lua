---@diagnostic disable: undefined-global
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end,
      mode = "",
      desc = "format buffer",
    },
  },
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
  },
}

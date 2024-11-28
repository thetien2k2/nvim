---@diagnostic disable: undefined-global
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      jsx = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      less = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
    },
    -- Set this to change the default values when calling conform.format()
    -- This will also affect the default values for format_on_save/format_after_save
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}

  return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
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
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  }
return {
  {
    "williamboman/mason.nvim",
    enabled = false,
  },
  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    -- opts = {},
    opts = {
      formatters_by_ft = {
        go = { "gofmt" },
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

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "templ",
        "lua",
        "typescript",
        "javascript",
        "css",
        "html",
      },
    },
  },

  require("luasnip").filetype_extend("templ", { "html" }),
}

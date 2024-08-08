return {
  {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    -- opts = {},
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        angular = { "prettierd" },
        css = { "prettierd" },
        flow = { "prettierd" },
        graphql = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        jsx = { "prettierd" },
        javascript = { "prettierd" },
        less = { "prettierd" },
        markdown = { "prettierd" },
        scss = { "prettierd" },
        typescript = { "prettierd" },
        vue = { "prettierd" },
        yaml = { "prettierd" },
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "goimports",
        "templ",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "htmx-lsp",
        "tailwindcss-language-server",
        "lua-language-server",
        "prettierd",
      },
    },
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

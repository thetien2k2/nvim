return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
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
        "prettier",
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
  require'luasnip'.filetype_extend("templ", {"html"})
}


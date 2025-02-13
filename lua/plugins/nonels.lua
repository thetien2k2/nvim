return {
  {
    "nvimtools/none-ls.nvim",
    version = false,
    enabled = true,
    event = "VeryLazy",
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.gomodifytags,
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.prettier,
        },
      }
    end,
  },
}


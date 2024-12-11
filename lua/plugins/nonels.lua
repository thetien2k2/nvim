---@diagnostic disable: undefined-global
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
          null_ls.builtins.completion.luasnip,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.gomodifytags,
          null_ls.builtins.code_actions.impl,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
        },
      }
    end,
  },
}

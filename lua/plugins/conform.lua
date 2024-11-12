---@diagnostic disable: undefined-global
---prettier formats go template
---npm install --save-dev prettier prettier-plugin-go-template
---create .prettierrc
---{
--     "plugins": [
--         "prettier-plugin-go-template"
--     ],
--     "overrides": [
--         {
--             "files": [
--                 "*.html"
--             ],
--             "options": {
--                 "parser": "go-template"
--             }
--         }
--     ]
-- }
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofmt" },
      gotmpl = { "prettier" },
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

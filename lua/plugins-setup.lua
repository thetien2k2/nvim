---@diagnostic disable: undefined-global
-- require "coq_3p" {
--   { src = "nvimlua", short_name = "nLUA", conf_only = true },
-- }
-- vim.g.coq_settings = {
--   keymap = {
--     recommended = true,
--     pre_select = false,
--   },
-- }

require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }

-- require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }
require('telescope').load_extension('fzf')
-- vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })

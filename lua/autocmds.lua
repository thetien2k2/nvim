---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd

-- add gotmpl filetype
autocmd({ "BufEnter", "BufNewFile", "BufFilePost" }, {
  pattern = "*.gotmpl",
  callback = function()
    vim.api.nvim_command "set filetype=gotmpl"
    vim.treesitter.language.register("html", "gotmpl")
    vim.treesitter.start()
  end,
})

-- unfold all first 
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_feedkeys("zR", "n", false)
--   end,
-- })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

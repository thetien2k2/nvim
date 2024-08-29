---@diagnostic disable: undefined-global
local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })
-- map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear highlights" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })

map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "move line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "move line down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "move line up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy whole file" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "prev buffer" })
map("n", "<leader>t", "<cmd>terminal tree --gitignore<cr>", { desc = "tree" })
map("n", "<leader>e", "<cmd>Explore<cr>", { desc = "netrw" })
map("n", "<leader>f", function()
  require("conform").format()
end, { desc = "conform format" })
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "wrap" })
map("n", "<leader>tl", "<cmd>set nu!<CR>", { desc = "line number" })
map("n", "<leader>tr", "<cmd>set rnu!<CR>", { desc = "relative number" })

-- local map = function(keys, func, desc, mode)
--   mode = mode or "n"
--   vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- end
--
-- map("<leader>q", vim.diagnostic.setloclist, "diagnostic quickfix")
-- map("<leader>a", vim.lsp.buf.code_action, "code action", { "n", "x" })
-- --  To jump back, press <C-t>.
-- map("<leader>cd", require("fzf-lua").lsp_definitions, "definition")
-- map("<leader>cD", require("fzf-lua").lsp_declarations, "Declaration")
-- map("<leader>cr", require("fzf-lua").lsp_references, "references")
-- map("<leader>ci", require("fzf-lua").lsp_implementations, "implementation")
-- map("<leader>ct", require("fzf-lua").lsp_typedefs, "type definition")
-- map("<leader>ds", require("fzf-lua").lsp_document_symbols, "symbols")
-- map("<leader>ws", require("fzf-lua").lsp_workspace_symbols, "symbols")
-- map("<leader>wl", require("fzf-lua").lsp_workspace_symbols, "live symbols")
--
-- map("<leader>rn", vim.lsp.buf.rename, "rename")

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
-- map("cD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

-- map("n", "gl", vim.lsp.buf.declaration, { desc = "Go to declaration" })
-- map("n", "gD", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
-- map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
-- map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
--
-- map("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "signature help" })
-- map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
-- map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
--
-- map("n", "<leader>lwl", function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, { desc = "list workspace folders" })
--
-- map("n", "<leader>lR", function()
--   require "nvchad.lsp.renamer"()
-- end, { desc = "NvRenamer" })
--
-- map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "code action" })
-- map("n", "<leader>lql", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
-- map("n", "<leader>lqq", vim.diagnostic.setqflist, { desc = "lsp diagnostic quickfix" })
-- map("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "references" })
-- map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "definitions" })
-- map("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "type definitions" })
-- map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "implementations" })
-- map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "document symbols" })
-- map("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "workspace symbols" })
-- map("n", "<leader>ll", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "query ws symbols" })
-- map("n", "<leader>lI", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "incoming calls" })
-- map("n", "<leader>lO", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "outgoing calls" })
-- map("n", "<leader>lf", "<cmd>Telescope lsp_finder<CR>", { desc = "locations" })
--
-- map("n", "<leader>lqd", "<cmd>Telescope diagnostics_document<CR>", { desc = "document diagnostics" })
-- map("n", "<leader>lqw", "<cmd>Telescope diagnostics_workspace<CR>", { desc = "workspace diagnostics" })

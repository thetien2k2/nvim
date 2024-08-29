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


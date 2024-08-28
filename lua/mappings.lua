local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })
-- map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear highlights" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'exit terminal mode' })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

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

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
-- map("n", "<leader>w", "<cmd>w<CR>", { desc = "save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy whole file" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "new buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "prev buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "close buffer" })
-- vim.keymap.del("n", "<C-n>")
map("n", "<leader>e", "<cmd>Explore<cr>", { desc = "netrw" })
map("n", "<leader>r", "<cmd>terminal tree --gitignore --metafirst -guhD<cr>", { desc = "tree" })

map("n", "<leader>a", function()
  require("conform").format()
end, { desc = "conform format" })

map("n", "<leader>nw", "<cmd>set wrap!<CR>", { desc = "toggle wrap" })
map("n", "<leader>nl", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>nK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>nk", function()
 vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

map("n", "<leader>s", "<cmd>FzfLua live_grep<CR>", { desc = "live grep" })
map("n", "<leader>/", "<cmd>FzfLua grep<CR>", { desc = "grep" })
map("n", "<leader>z", "<cmd>FzfLua builtin<CR>", { desc = "fzf builtin" })

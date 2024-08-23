local map = vim.keymap.set

require("which-key").add {
  { "<leader>b", group = "buffer" },
  { "<leader>f", group = "fzf" },
  { "<leader>g", group = "git" },
  { "<leader>n", group = "nvchad" },
  { "<leader>l", group = "lsp" },
}

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Move Lines
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

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear highlights" })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
-- map("n", "<leader>w", "<cmd>w<CR>", { desc = "save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy whole file" })

-- tabufline
map("n", "<leader>bb", "<cmd>enew<CR>", { desc = "new buffer" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "next buffer" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "prev buffer" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "close buffer" })

map("n", "<leader>bx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "close all + tab" })

map("n", "<leader>bl", function()
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "close buffers at left" })

map("n", "<leader>br", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
end, { desc = "close buffers at right" })

map("n", "<leader>b[", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "move left" })

map("n", "<leader>b]", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "move right" })

-- -- Comment
-- map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
-- map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus" })

-- terminal
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "horizontal terminal" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "vertical terminal" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- vim.keymap.del("n", "<C-n>")

map("n", "<leader>c", "<cmd> cd %:p:h <cr>", { desc = "cwd to current file" })
map("n", "<leader>w", "<cmd>Explore<cr>", { desc = "netrw" })

map("n", "<leader>a", function()
  require("conform").format()
end, { desc = "conform format" })

--- nvchad
map("n", "<leader>nw", "<cmd>set wrap!<CR>", { desc = "toggle wrap" })
map("n", "<leader>nl", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>nh", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })
map("n", "<leader>nt", "<cmd>Telescope terms<CR>", { desc = "hidden term" })
map("n", "<leader>n=", "<cmd>Telescope themes<CR>", { desc = "themes" })
map("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvtree" })
map("n", "<leader>nK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>nk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "buffers" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "files" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "opened files history" })
map("n", "<leader>fq", "<cmd>FzfLua quickfix<CR>", { desc = "quickfix list" })
map("n", "<leader>fQ", "<cmd>FzfLua quickfix_stack<CR>", { desc = "quickfix stack" })
map("n", "<leader>fl", "<cmd>FzfLua loclist<CR>", { desc = "location list" })
map("n", "<leader>fL", "<cmd>FzfLua loclist_stack<CR>", { desc = "location stack" })
map("n", "<leader>fi", "<cmd>FzfLua lines<CR>", { desc = "open buffers lines" })
map("n", "<leader>fI", "<cmd>FzfLua blines<CR>", { desc = "current buffers lines" })
map("n", "<leader>ft", "<cmd>FzfLua tabs<CR>", { desc = "tabs" })
map("n", "<leader>f/", "<cmd>FzfLua live_grep<CR>", { desc = "live grep" })
map("n", "<leader>fw", "<cmd>FzfLua grep_cword<CR>", { desc = "cword" })
map("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<CR>", { desc = "cWORD" })

map("n", "<leader>fc", "<cmd>FzfLua command_history<CR>", { desc = "command history" })
map("n", "<leader>fs", "<cmd>FzfLua search_history<CR>", { desc = "search history" })
map("n", "<leader>fm", "<cmd>FzfLua marks<CR>", { desc = "marks" })
map("n", "<leader>fB", "<cmd>FzfLua builtin<CR>", { desc = "fzf builtin" })

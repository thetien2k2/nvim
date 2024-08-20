local map = vim.keymap.set

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

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map("n", "<leader>X", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "buffer close all + tab" })

map("n", "<leader>cr", function()
  require("nvchad.tabufline").closeBufs_at_direction("right")
end, { desc = "close buffers at right" })

map("n", "<leader>cl", function()
  require("nvchad.tabufline").closeBufs_at_direction("left")
end, { desc = "close buffers at left" })

map("n", "<leader>ml", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "move left" })

map("n", "<leader>mr", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "move right" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

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

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- vim.keymap.del("n", "<C-n>")

map("n", "<leader>cd", "<cmd> cd %:p:h <cr>", { desc = "cwd to current file" })
map("n", "-", "<cmd>Oil<cr>", { desc = "oil file manager" })

map("n", "<leader>q", function()
  require("conform").format()
end, { desc = "conform format" })

require("which-key").add {
 { "<leader>f", group = "fzf" },
 { "<leader>g", group = "git" },
 { "<leader>n", group = "nvchad" },
 { "<leader>l", group = "lsp" },
}

--- nvchad 
map("n", "<leader>nw", "<cmd>set wrap!<CR>", { desc = "toggle wrap" })
map("n", "<leader>nn", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>nc", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })
map("n", "<leader>nt", "<cmd>Telescope terms<CR>", { desc = "hidden term" })
map("n", "<leader>n=", "<cmd>Telescope themes<CR>", { desc = "themes" })
map("n", "<leader>nb", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvtree" })

-- fzf buffers and files
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "buffers" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "files" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "opened files history" })
map("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { desc = "live grep" })
map("n", "<leader>fg", "<cmd>FzfLua grep_string<CR>", { desc = "grep string" })
map("n", "<leader>fa", "<cmd>FzfLua find_files follow=true no_ignore=true hidden=true<CR>", { desc = "all files" })
-- telescope vim pickers
map("n", "<leader>fc", "<cmd>FzfLua commands<CR>", { desc = "commands" })
map("n", "<leader>fs", "<cmd>FzfLua command_history<CR>", { desc = "command history" })
map("n", "<leader>fd", "<cmd>FzfLua search_history<CR>", { desc = "search history" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "help page" })
map("n", "<leader>fm", "<cmd>FzfLua marks<CR>", { desc = "marks" })
map("n", "<leader>f/", "<cmd>FzfLua current_buffer_fuzzy_find<CR>", { desc = "in current buffer" })
-- git related
map("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "telescope branches" })
map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "telescope commits" })
map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "telescope status" })
map("n", "<leader>gt", "<cmd>FzfLua git_stash<CR>", { desc = "telescope stash" })
map("n", "<leader>gf", "<cmd>FzfLua git_bcommits<CR>", { desc = "telescope buffer's commits" })
map("v", "<leader>gr", "<cmd>FzfLua git_bcommits_range<CR>", { desc = "telescope buffer's range commits" })

-- lsp related
map("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "references" })
map("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "definitions" })
map("n", "<leader>lD", "<cmd>FzfLua lsp_declarations<CR>", { desc = "declarations" })
map("n", "<leader>lt", "<cmd>FzfLua lsp_typedefs<CR>", { desc = "type definitions" })
map("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", { desc = "implementations" })
map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "document symbols" })
map("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "workspace symbols" })
map("n", "<leader>ll", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "live query ws symbols" })
map("n", "<leader>lI", "<cmd>FzfLua lsp_incoming_calls<CR>", { desc = "incoming calls" })
map("n", "<leader>lO", "<cmd>FzfLua lsp_outgoing_calls<CR>", { desc = "outgoing calls" })
map({"n", "v"}, "<leader>la", "<cmd>FzfLua lsp_code_actions<CR>", { desc = "code actions" })
map("n", "<leader>lf", "<cmd>FzfLua lsp_finder<CR>", { desc = "locations" })
map("n", "<leader>lq", "<cmd>FzfLua diagnostics_document<CR>", { desc = "document diagnostics" })
map("n", "<leader>lw", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "workspace diagnostics" })

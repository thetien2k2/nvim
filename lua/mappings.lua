---@diagnostic disable: undefined-global
local map = vim.keymap.set
local wk = require "which-key"

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlights" })
map("n", "<leader>e", "<cmd>Explore<cr>", { desc = "netrw" })
map(
  "n",
  "<leader>R",
  "<cmd>enew | setlocal buftype=nowrite noswapfile | read ! tree --gitignore --dirsfirst<cr>",
  { desc = "print tree" }
)
-- map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear highlights" })
-- map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })
-- map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
-- map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
-- map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy whole file" })
-- map("n", "<tab>", "<cmd>bnext<cr>", { desc = "next buffer" })
-- map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "prev buffer" })
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "move line down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "move line up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move line down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move line up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "move line down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "move line up" })

-- cmp
-- local cmp = require "cmp"
-- cmp.setup {
--   mapping = cmp.mapping.preset.insert {
--     ["<C-n>"] = cmp.mapping.select_next_item(),
--     ["<C-p>"] = cmp.mapping.select_prev_item(),
--     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-y>"] = cmp.mapping.confirm { select = true },
--     -- ["<CR>"] = cmp.mapping.confirm { select = false },
--     -- ["<S-CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace },
--     -- ["<C-CR>"] = function(fallback)
--     --   cmp.abort()
--     --   fallback()
--     -- end,
--     ["<C-Space>"] = cmp.mapping.complete {},
--   },
-- }

-- luasnip
-- local ls = require "luasnip"
-- map("i", "<C-k>", function()
--   if ls.expandable() then
--     return ls.expand()
--   else
--     return "<C-k>"
--   end
-- end, { silent = true })
-- map({ "i", "s" }, "<C-l>", function()
--   if ls.jumpable(1) then
--     return ls.jump(1)
--   else
--     return "<C-l>"
--   end
-- end, { silent = true })
-- map({ "i", "s" }, "<C-j>", function()
--   if ls.jumpable(-1) then
--     return ls.jump(-1)
--   else
--     return "<C-j>"
--   end
-- end, { silent = true })
-- map({ "i", "s" }, "<C-e>", function()
--   if ls.choice_active() then
--     return ls.change_choice(1)
--   else
--     return "<C-e>"
--   end
-- end, { silent = true })

-- fzf
local fzf = require "fzf-lua"
map("n", "<leader><leader>", fzf.buffers, { desc = "buffers" })
map("n", "<leader>s", fzf.lsp_document_symbols, { desc = "document_symbols" })
map("n", "<leader>S", fzf.lsp_live_workspace_symbols, { desc = "workspace_symbols" })
map("n", "<leader>D", function()
  fzf.diagnostics_document {
    winopts = {
      preview = {
        layout = "vertical",
      },
    },
  }
end, { desc = "fzf diag doc" })
map("n", "<leader>Q", function()
  fzf.diagnostics_workspace {
    winopts = {
      preview = {
        layout = "vertical",
      },
    },
  }
end, { desc = "fzf diag wspc" })
map("n", "<leader>d", vim.diagnostic.setloclist, { desc = "loclist diag doc" })
map("n", "<leader>q", vim.diagnostic.setqflist, { desc = "qflist diag wspc" })
map("n", "<leader>r", fzf.lsp_references, { desc = "lsp_references" })
map("n", "<leader>b", fzf.builtin, { desc = "fzf.builtin" })
map("n", "<leader>f", fzf.files, { desc = "files" })
map("n", "<leader>g", fzf.grep, { desc = "grep" })
map("v", "<leader>g", fzf.grep_visual, { desc = "grep_visual" })
map("n", "<leader>l", fzf.live_grep, { desc = "live_grep" })
map("n", "<leader>j", fzf.jumps, { desc = "jumps" })
map("n", "<leader>m", fzf.marks, { desc = "marks" })
map("n", "<leader>.", fzf.resume, { desc = "resume last comamnd/query" })
map("n", "<leader>k", fzf.live_grep_resume, { desc = "live_grep_resume" })
map("n", "<leader>T", fzf.treesitter, { desc = "treesitter" })
map("n", "<leader>w", fzf.grep_cword, { desc = "grep_cword" })
map("n", "<leader>W", fzf.grep_cWORD, { desc = "grep_cWORD" })
map("n", "<leader>H", fzf.help_tags, { desc = "help_tags" })
wk.add {
  { "<leader>t", group = "toggle" },
}
map("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "hint" })
map("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "wrap" })
map("n", "<leader>tl", "<cmd>set nu!<CR>", { desc = "line number" })
map("n", "<leader>tr", "<cmd>set rnu!<CR>", { desc = "relative number" })

wk.add {
  { "gr", group = "lsp" },
  { "gs", group = "treesitter" },
}
map("n", "grn", vim.lsp.buf.rename, { desc = "rename" })
map({ "n", "v" }, "gra", vim.lsp.buf.code_action, { desc = "code_action" })
map("n", "grr", vim.lsp.buf.references, { desc = "references" })
map("n", "gri", vim.lsp.buf.implementation, { desc = "implementation" })
map("n", "gO", vim.lsp.buf.document_symbol, { desc = "document_symbol" })
map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "signature_help" })
map("n", "grt", vim.lsp.buf.type_definition, { desc = "type_definition" })
map("n", "grd", vim.lsp.buf.definition, { desc = "definition" })
map("n", "grD", vim.lsp.buf.declaration, { desc = "decalration" })
map("n", "grf", function()
  vim.lsp.buf.format {
    timeout_ms = 10000,
    async = false,
  }
end, { desc = "format" })
map("n", "grh", vim.lsp.buf.typehierarchy, { desc = "typehierarchy" })
-- map("n", "grq", vim.diagnostic.setqflist, { desc = "diagnostic" })
map("n", "grFa", vim.lsp.buf.add_workspace_folder, { desc = "add_workspace_folder" })
map("n", "grFr", vim.lsp.buf.remove_workspace_folder, { desc = "remove_workspace_folder" })
map("n", "grFl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "list_workspace_folders" })

-- gitsigns
local gitsigns = require "gitsigns"
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "Jump to next git change" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "Jump to previous git change" })
wk.add {
  { "<leader>h", group = "git hunk", mode = { "n", "v" } },
}
map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "stage git hunk" })
map("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "reset git hunk" })
map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "stage hunk" })
map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "reset hunk" })
map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })
map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview hunk" })
map("n", "<leader>hb", gitsigns.blame_line, { desc = "blame line" })
map("n", "<leader>hd", gitsigns.diffthis, { desc = "diff against index" })
map("n", "<leader>hD", function()
  gitsigns.diffthis "@"
end, { desc = "Diff against last commit" })
map("n", "<leader>ht", gitsigns.toggle_current_line_blame, { desc = "toggle_current_line_blame" })
map("n", "<leader>hT", gitsigns.toggle_deleted, { desc = "toggle_deleted" })

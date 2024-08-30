---@diagnostic disable: undefined-global
local map = vim.keymap.set
local wk = require "which-key"
wk.add {
  { "<leader>s", group = "search" },
  { "<leader>d", group = "document" },
  { "<leader>w", group = "workspace" },
  { "<leader>r", group = "rename" },
  { "<leader>t", group = "toggle" },
  { "<leader>h", group = "git hunk", mode = { "n", "v" } },
  { "<leader>c", group = "code", mode = { "n", "x" } },
}

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
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "wrap" })
map("n", "<leader>tl", "<cmd>set nu!<CR>", { desc = "line number" })
map("n", "<leader>tr", "<cmd>set rnu!<CR>", { desc = "relative number" })

local cmp = require "cmp"
cmp.setup {
  mapping = cmp.mapping.preset.insert {
    -- Select the [n]ext item
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- Select the [p]revious item
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- Scroll the documentation window [b]ack / [f]orward
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- Accept ([y]es) the completion.
    --  This will auto-import if your LSP supports it.
    --  This will expand snippets if the LSP sent a snippet.
    ["<C-y>"] = cmp.mapping.confirm { select = true },
    -- ["<CR>"] = cmp.mapping.confirm { select = false },
    -- ["<S-CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace },
    -- ["<C-CR>"] = function(fallback)
    --   cmp.abort()
    --   fallback()
    -- end,

    -- Manually trigger a completion from nvim-cmp.
    --  Generally you don't need this, because nvim-cmp will display
    --  completions whenever it has completion options available.
    ["<C-Space>"] = cmp.mapping.complete {},

    -- Think of <c-l> as moving to the right of your snippet expansion.
    --  So if you have a snippet that's like:
    --  function $name($args)
    --    $body
    --  end
    --
    -- <c-l> will move you to the right of each of the expansion locations.
    -- <c-h> is similar, except moving you backwards.
    ["<C-l>"] = cmp.mapping(function()
      -- if luasnip.expand_or_locally_jumpable() then
      --   luasnip.expand_or_jump()
      -- end
      if vim.snippet.active { direction = 1 } then
        vim.schedule(function()
          vim.snippet.jump(1)
        end)
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      -- if luasnip.locally_jumpable(-1) then
      --   luasnip.jump(-1)
      -- end
      if vim.snippet.active { direction = -1 } then
        vim.schedule(function()
          vim.snippet.jump(-1)
        end)
      end
    end, { "i", "s" }),

    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },
}

map("n", "<leader>f", function()
  require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "conform.format" })

local fzf = require "fzf-lua"
map("n", "<leader><leader>", fzf.buffers, { desc = "select buffers" })
map("n", "<leader>p", fzf.files, { desc = "files" })
map("n", "<leader>k", fzf.commands, { desc = "commands" })
map("n", "<leader>l", fzf.live_grep, { desc = "live grep" })
map("n", "<leader>g", fzf.grep, { desc = "grep" })
map("n", "<leader>z", fzf.builtin, { desc = "fzf builtin" })

-- map("n", "<leader>so", fzf.oldfiles, { desc = "old files" })
-- map("n", "<leader>sc", fzf.command_history, { desc = "command history" })
-- map("n", "<leader>ss", fzf.search_history, { desc = "search history" })
map("n", "<leader>sh", fzf.help_tags, { desc = "help tags" })
-- map("n", "<leader>s`", fzf.marks, { desc = "marks" })
-- map("n", "<leader>sq", fzf.quickfix, { desc = "quickfix" })
-- map("n", "<leader>sQ", fzf.quickfixhistory, { desc = "quickfix history" })
-- map("n", "<leader>sl", fzf.loclist, { desc = "location" })
-- map("n", "<leader>sj", fzf.jumplist, { desc = "jump" })
-- map("n", "<leader>sO", fzf.vim_options, { desc = "vim options" })
-- map("n", '<leader>s"', fzf.registers, { desc = "registers" })
-- map("n", "<leader>sa", fzf.autocommands, { desc = "autocommands" })
-- map("n", "<leader>sz", fzf.current_buffer_fuzzy_find, { desc = "fuzzy current buffer" })
-- map("n", "<leader>sk", fzf.keymaps, { desc = "keymaps" })
-- map("n", "<leader>s.", fzf.resume, { desc = "resume" })
-- map("n", "<leader>sp", fzf.pickers, { desc = "previous pickers" })
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

local gitsigns = require "gitsigns"
-- Navigation
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "Jump to next git [c]hange" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "Jump to previous git [c]hange" })
-- Actions
-- visual mode
map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "stage git hunk" })
map("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "reset git hunk" })
-- normal mode
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
-- Toggles
map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "git show blame line" })
map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "git show deleted" })

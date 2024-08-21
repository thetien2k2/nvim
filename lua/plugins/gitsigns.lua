return {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
  opts = function()
    dofile(vim.g.base46_cache .. "git")

    local options = {
      signs = {
        delete = { text = "󰍵" },
        changedelete = { text = "󱕖" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function opts(desc)
          return { buffer = bufnr, desc = desc }
        end

        local map = vim.keymap.set

        map("n", "<leader>gr", gs.reset_hunk, { desc = "reset hunk" })
        map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
        map("n", "<leader>gb", gs.blame_line, { desc = "blame line" })
        map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "status" })
        map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "commits" })
        map("n", "<leader>gC", "<cmd>Telescope git_bcommits<CR>", { desc = "buffer's commits" })
        map("n", "<leader>gB", "<cmd>Telescope git_branches<CR>", { desc = "branches" })
        map("n", "<leader>gS", "<cmd>Telescope git_stash<CR>", { desc = "stash" })
        map("n", "<leader>gt", "<cmd>FzfLua git_tags<CR>", { desc = "tags" })
      end,
    }

    return options
  end,
}

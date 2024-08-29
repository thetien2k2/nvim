---@diagnostic disable: undefined-global
return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup {
      -- "max-perf",
      winopts = {
        border = "single",
        preview = {
          border = "noborder",
        },
      },
    }
    local map = vim.keymap.set
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
    -- map("n", "<leader>sh", fzf.help_tags, { desc = "help tags" })
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
  end,
}

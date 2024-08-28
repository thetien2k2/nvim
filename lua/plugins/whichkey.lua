return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "telescope" },
      { "<leader>l", group = "lsp" },
      { "<leader>h", group = "git hunk", mode = { "n", "v" } },
    },
  },
  cmd = "WhichKey",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "local keymaps",
    },
  },
}

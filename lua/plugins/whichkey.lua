---@diagnostic disable: undefined-global
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = { mappings = false },
    spec = {
      { "<leader>s", group = "search" },
      { "<leader>d", group = "document" },
      { "<leader>w", group = "workspace" },
      { "<leader>r", group = "rename" },
      { "<leader>t", group = "toggle" },
      { "<leader>h", group = "git hunk", mode = { "n", "v" } },
      { "<leader>c", group = "code", mode = { "n", "x" } },
    },
  },
  cmd = "WhichKey",
  keys = {},
}

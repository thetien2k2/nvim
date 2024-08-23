return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
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
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
  end,
}

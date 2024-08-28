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
    require("which-key").setup(opts)
  end,
}

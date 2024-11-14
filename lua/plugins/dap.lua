return {
  "rcarriga/nvim-dap-ui",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    { "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio" },
    { "leoluz/nvim-dap-go", dependencies = { "mfussenegger/nvim-dap" } },
  },
}

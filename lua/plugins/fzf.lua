return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup {
      "max-perf",
      winopts = {
        border = "single",
        preview = {
          border = "noborder",
        },
      },
    }
  end,
}

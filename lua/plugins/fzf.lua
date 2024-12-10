---@diagnostic disable: undefined-global
return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup {
      -- "max-perf",
      -- "fzf-native",
      winopts = {
        border = "single",
        preview = {
          border = "noborder",
        },
      },
    }
  end,
}

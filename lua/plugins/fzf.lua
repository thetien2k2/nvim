---@diagnostic disable: undefined-global
return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup {
      -- "max-perf",
      "fzf-native",
      winopts = {
        border = "none",
        -- border = "single",
        preview = {
          border = "noborder",
          vertical = "down:65%",
          layout = "vertical",
        },
      },
    }
  end,
}

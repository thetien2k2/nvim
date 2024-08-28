return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = "Telescope",
  opts = function()
    local options = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
        cache_picker = {
          num_pickers = 10,
        },
      },
    }

    return options
  end,
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)
  end,
}

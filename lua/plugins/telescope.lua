return {
  'nvim-telescope/telescope.nvim',
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          width = { padding = 0 },
          height = { padding = 0 },
          preview_width = 0.5,
        },
      },
      sorting_strategy = "ascending",
    },
    pickers = {
      buffers = {
        previewer = false,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    },
  },
}

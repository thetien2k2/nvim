---@diagnostic disable: undefined-global
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      theme = "nord",
    },
    -- extenstions conflick with fzf-lua
    -- extensions = {
    -- "fzf",
    --   "quickfix",
    -- },
    sections = {
      lualine_y = { "v:register" },
      lualine_z = {
        function()
          local line = vim.fn.line "."
          local totalline = vim.fn.line "$"
          local col = vim.fn.charcol "."
          local totalcol = vim.fn.charcol "$"
          return string.format("row:%d/%d col:%d/%d", line, totalline, col, totalcol)
        end,
      },
    },
  },
}

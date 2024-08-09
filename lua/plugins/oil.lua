---@type NvPluginSpec
return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  opts = {
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
  },
}

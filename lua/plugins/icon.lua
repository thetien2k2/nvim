return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true,
      strict = true,
      override_by_extension = {
        ["gotmpl"] = {
          icon = "",
          color = "#81e043",
          name = "gotmpl",
        },
      },
    },
  },
}

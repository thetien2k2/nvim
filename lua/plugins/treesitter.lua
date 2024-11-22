---@diagnostic disable: undefined-global
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = function()
    pcall(function()
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
    end)

    local options = {
      ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "templ",
        "typescript",
        "javascript",
        "json",
        "css",
        "html",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "gnf",
          scope_incremental = "gns",
          node_decremental = "gnd",
        },
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    }

    return options
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

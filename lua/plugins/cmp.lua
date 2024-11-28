---@diagnostic disable: undefined-global
return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "VeryLazy",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    {
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },

  config = function()
    local cmp = require "cmp"
    cmp.setup {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      view = {
        entries = { "custom", selection_order = "top_down" },
      },
      window = {
        completion = {
          border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        },
        documentation = {
          border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        },
      },
      formatting = {
        format = function(entry, vim_item)
          local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰡱",
            Constructor = "",
            Field = "󰽑",
            Variable = "󰫧",
            Class = "",
            Interface = "",
            Module = "󱒌",
            Property = "",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
          }
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

          return vim_item
        end,
      },
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
      }, {
        { name = "buffer" },
        -- { name = "path" },
        -- { name = "cmdline" },
      }),
    }

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      view = {
        entries = { "custom", selection_order = "near_cursor" },
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}

---@diagnostic disable: undefined-global
return {
  "hrsh7th/nvim-cmp",
  version = false,
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      config = function(_, opts)
        require("luasnip").config.set_config(opts)
        require("luasnip.loaders.from_vscode").lazy_load()
        vim.api.nvim_create_autocmd("InsertLeave", {
          callback = function()
            if
              require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
              and not require("luasnip").session.jump_active
            then
              require("luasnip").unlink_current()
            end
          end,
        })
        require("luasnip").filetype_extend("gotmpl", { "html" })
      end,
    },
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
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },

  config = function()
    local cmp = require "cmp"
    -- local luasnip = require "luasnip"
    cmp.setup {
      snippet = {
        expand = function(args)
          -- luasnip.lsp_expand(args.body)
          vim.snippet.expand(args.body)
        end,
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
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
        { name = "cmdline" },
      }),
    }

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
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

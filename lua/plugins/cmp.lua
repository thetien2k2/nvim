---@diagnostic disable: undefined-global
return {
  "hrsh7th/nvim-cmp",
  version = false,
  -- enabled = false,
  event = "VeryLazy",
  dependencies = {
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
        entries = { "native" },
      },
      completion = {
        completeopt = "menu,menuone,noselect,noinsert,popup",
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
      }, {
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              local buf = vim.api.nvim_get_current_buf()
              local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              if byte_size > 5 * 1024 * 1024 then
                return {}
              end
              return { buf }
            end,
          },
        },
      }),
    }

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              local buf = vim.api.nvim_get_current_buf()
              local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              if byte_size > 5 * 1024 * 1024 then
                return {}
              end
              return { buf }
            end,
          },
        },
      },
    })

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

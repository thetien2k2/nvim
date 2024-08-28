return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- Allows extra capabilities provided by nvim-cmp
    { 'j-hui/fidget.nvim', opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- require "configs.lspconfig"
    local M = {}
    local map = vim.keymap.set

    -- export on_attach & capabilities
    M.on_attach = function(_, bufnr)
      local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
      end

      map("n", "gl", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      map("n", "gD", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
      map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })

      map("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "signature help" })
      map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
      map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })

      map("n", "<leader>lwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "list workspace folders" })

      map("n", "<leader>lR", function()
        require "nvchad.lsp.renamer" ()
      end, { desc = "NvRenamer" })

      map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "code action" })
      map("n", "<leader>lql", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
      map("n", "<leader>lqq", vim.diagnostic.setqflist, { desc = "lsp diagnostic quickfix" })
      map("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "references" })
      map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "definitions" })
      map("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "type definitions" })
      map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "implementations" })
      map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "document symbols" })
      map("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "workspace symbols" })
      map("n", "<leader>ll", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "query ws symbols" })
      map("n", "<leader>lI", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "incoming calls" })
      map("n", "<leader>lO", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "outgoing calls" })
      map("n", "<leader>lf", "<cmd>Telescope lsp_finder<CR>", { desc = "locations" })

      map("n", "<leader>lqd", "<cmd>Telescope diagnostics_document<CR>", { desc = "document diagnostics" })
      map("n", "<leader>lqw", "<cmd>Telescope diagnostics_workspace<CR>", { desc = "workspace diagnostics" })
    end

    -- disable semanticTokens
    -- M.on_init = function(client, _)
    --   -- vim.print(client.supports_method "textDocument/semanticTokens")
    --   -- vim.print(vim.tbl_keys(client.server_capabilities.semanticTokensProvider))
    --
    --   -- if client.supports_method "textDocument/semanticTokens" then
    --   --   client.server_capabilities.semanticTokensProvider = nil
    --   -- end
    -- end

    M.capabilities = vim.lsp.protocol.make_client_capabilities()

    M.capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    M.defaults = function() end

    local servers = {
      lua_ls = {
        settings = {
          lua = {
            semanticTokens = true,
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.fn.expand "$VIMRUNTIME/lua",
                vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                "${3rd}/luv/library",
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
          },
        },
      },
      html = {
        filetypes = { "html", "templ", "gotmpl" },
      },
      cssls = {},
      gopls = {
        settings = {
          gopls = {
            semanticTokens = true,
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
            gofumpt = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      },
      tsserver = {
        settings = {
          tsserver = {
            semanticTokens = true,
          },
        },
      },
      -- templ = {},
      -- htmx = {
      --   filetypes = { "html", "templ" },
      -- },
      -- tailwindcss = {
      --   -- filetypes = { "css", "html", "templ", "astro", "javascript", "typescript", "react" },
      --   settings = {
      --     tailwindCSS = {
      --       semanticTokens = true,
      --       includeLanguages = {
      --         templ = "html",
      --       },
      --     },
      --   },
      -- },
    }

    for name, opts in pairs(servers) do
      -- opts.on_init = M.on_init
      opts.on_attach = M.on_attach
      opts.capabilities = M.capabilities

      require("lspconfig")[name].setup(opts)
    end
  end,
}

---@diagnostic disable: undefined-global
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
    -- and elegantly composed help section, `:help lsp-vs-treesitter`

    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    --    function will be executed to configure the current buffer
    --
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("<leader>q", vim.diagnostic.setloclist, "diagnostic quickfix")
        map("<leader>a", vim.lsp.buf.code_action, "code action", { "n", "x" })
        --  To jump back, press <C-t>.
        map("<leader>cd", require("fzf-lua").lsp_definitions, "definition")
        map("<leader>cD", require("fzf-lua").lsp_declarations, "Declaration")
        map("<leader>cr", require("fzf-lua").lsp_references, "references")
        map("<leader>ci", require("fzf-lua").lsp_implementations, "implementation")
        map("<leader>ct", require("fzf-lua").lsp_typedefs, "type definition")
        map("<leader>ds", require("fzf-lua").lsp_document_symbols, "symbols")
        map("<leader>ws", require("fzf-lua").lsp_workspace_symbols, "symbols")
        map("<leader>wl", require("fzf-lua").lsp_workspace_symbols, "live symbols")

        map("<leader>rn", vim.lsp.buf.rename, "rename")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        -- map("cD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- map("n", "gl", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        -- map("n", "gD", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
        -- map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        -- map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
        -- map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
        --
        -- map("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "signature help" })
        -- map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
        -- map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
        --
        -- map("n", "<leader>lwl", function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, { desc = "list workspace folders" })
        --
        -- map("n", "<leader>lR", function()
        --   require "nvchad.lsp.renamer"()
        -- end, { desc = "NvRenamer" })
        --
        -- map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "code action" })
        -- map("n", "<leader>lql", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
        -- map("n", "<leader>lqq", vim.diagnostic.setqflist, { desc = "lsp diagnostic quickfix" })
        -- map("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "references" })
        -- map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "definitions" })
        -- map("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "type definitions" })
        -- map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "implementations" })
        -- map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "document symbols" })
        -- map("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "workspace symbols" })
        -- map("n", "<leader>ll", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "query ws symbols" })
        -- map("n", "<leader>lI", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "incoming calls" })
        -- map("n", "<leader>lO", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "outgoing calls" })
        -- map("n", "<leader>lf", "<cmd>Telescope lsp_finder<CR>", { desc = "locations" })
        --
        -- map("n", "<leader>lqd", "<cmd>Telescope diagnostics_document<CR>", { desc = "document diagnostics" })
        -- map("n", "<leader>lqw", "<cmd>Telescope diagnostics_workspace<CR>", { desc = "workspace diagnostics" })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event2.buf }
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    -- capabilities.textDocument.completion.completionItem = {
    --   documentationFormat = { "markdown", "plaintext" },
    --   snippetSupport = true,
    --   preselectSupport = true,
    --   insertReplaceSupport = true,
    --   labelDetailsSupport = true,
    --   deprecatedSupport = true,
    --   commitCharactersSupport = true,
    --   tagSupport = { valueSet = { 1 } },
    --   resolveSupport = {
    --     properties = {
    --       "documentation",
    --       "detail",
    --       "additionalTextEdits",
    --     },
    --   },
    -- }

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
    }

    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      require("lspconfig")[name].setup(opts)
    end
  end,
}

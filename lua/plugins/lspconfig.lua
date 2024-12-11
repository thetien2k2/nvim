---@diagnostic disable: undefined-global
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {},
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
      callback = function(args)
        -- The following two autocommands are used to highlight references of the word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = args.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = args.buf,
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
        -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        --   vim.keymap.set("n", "<leader>th", function()
        --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf })
        --   end, { desc = "inlay hints" })
        -- end
      end,
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

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
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            semanticTokens = true,
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
            gofumpt = true,
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      ts_ls = {
        settings = {
          ts_ls = {
            semanticTokens = true,
          },
        },
      },
    }
    local lsp = require "lspconfig"
    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      lsp[name].setup(opts)
    end
  end,
}

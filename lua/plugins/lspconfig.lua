return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {},
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(args)
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
      end,
    })

    local servers = {
      lua_ls = {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
              return
            end
          end
        end,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      },
      cssls = {},
      eslint = {},
      html = {
        filetypes = { "html", "templ", "gotmpl" },
      },
      jsonls = {},
      ts_ls = {
        settings = {
          ts_ls = {
            semanticTokens = true,
          },
        },
      },
      efm = {
        cmd = { "efm-langserver", "-q", "-c", "/home/tiennguyen/.config/nvim/efm-config.yaml" },
        filetypes = { "go", "gotmpl", "gomod", "gowork", "html", "css", "js", "json", "jsx", "ts", "yaml", "markdown" },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
          codeAction = true,
          -- hover = true,
          -- documentSymbol = true,
          -- completion = true,
        },
      },
      gopls = {
        settings = {
          gopls = {
            semanticTokens = true,
            gofumpt = true,
            staticcheck = false,
            usePlaceholders = true,
            completeUnimported = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
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

    }
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.dynamicRegistration = true
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
    -- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
    local lsp = require "lspconfig"
    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      -- opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)
      lsp[name].setup(opts)
    end
  end,
}

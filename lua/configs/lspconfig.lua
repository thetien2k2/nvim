local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>lh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, opts "NvRenamer")

  -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
  -- map("n", "gr", vim.lsp.buf.references, opts "Show references")
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

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()
end

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
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
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

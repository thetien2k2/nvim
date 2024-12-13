---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd

-- add gotmpl filetype
autocmd({ "BufEnter", "BufNewFile", "BufFilePost" }, {
  pattern = "*.gotmpl",
  callback = function()
    vim.api.nvim_command "set filetype=gotmpl"
    vim.treesitter.language.register("html", "gotmpl")
    vim.treesitter.start()
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- lsp autocommands
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- avoid breaking formatexpr
    local function is_null_ls_formatting_enabled()
      local file_type = vim.api.nvim_buf_get_option(args.buf, "filetype")
      local generators =
        require("null-ls.generators").get_available(file_type, require("null-ls.methods").internal.FORMATTING)
      return #generators > 0
    end
    if client.server_capabilities.documentFormattingProvider then
      if client.name == "null-ls" and is_null_ls_formatting_enabled() or client.name ~= "null-ls" then
        vim.bo[args.buf].formatexpr = "v:lua.vim.lsp.formatexpr()"
      else
        vim.bo[args.buf].formatexpr = nil
      end
    end

    -- only use null-ls for formating on save
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format {
            filter = function()
              return client.name == "null-ls"
            end,
            bufnr = args.buf,
            async = false,
            timeout_ms = 10000,
          }
        end,
      })
    end
  end,
})

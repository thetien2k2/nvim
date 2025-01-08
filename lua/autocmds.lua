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

autocmd("BufWritePre", {
  callback = function(ev)
    -- print(string.format('event fired: %s', vim.inspect(ev)))
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local ft = vim.api.nvim_get_option_value("filetype", {})
    local formatters = {
      ["lua"] = "lua_ls",
      ["go"] = "efm",
      ["gotmp"] = "efm",
      ["gomod"] = "efm",
      ["gowork"] = "efm",
      ["html"] = "efm",
      ["css"] = "efm",
      ["json"] = "efm",
      ["js"] = "efm",
      ["ts"] = "efm",
      ["markdown"] = "efm",
      ["yaml"] = "efm",
    }
    if #clients == 0 then
      vim.notify("unable to format: no lsp attached", vim.log.levels.WARN)
      return
    end
    if formatters[ft] ~= "" then
      vim.lsp.buf.format {
        filter = function(client)
          return client.name == formatters[ft]
        end,
        bufnr = ev.buf,
        async = false,
        timeout_ms = 10000
      }
    end
  end
})

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
  -- lsp format
  pattern = "*",
  callback = function(ev)
    -- print(string.format('event fired: %s', vim.inspect(ev)))
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local ft = vim.api.nvim_get_option_value("filetype", {})
    local formatters = {
      ["lua"] = "lua_ls",
      ["go"] = "efm",
      ["gomod"] = "efm",
      ["gotmp"] = "efm",
      ["gowork"] = "efm",
      ["html"] = "efm",
      ["css"] = "efm",
      ["json"] = "efm",
      ["javascript"] = "efm",
      ["typescript"] = "efm",
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

  -- conform format
  -- callback = function(args)
  --   require("conform").format({ async = false, lsp_format = "fallback", bufnr = args.buf })
  -- end,
})

-- vim.api.nvim_create_user_command("Format", function(args)
--   local range = nil
--   if args.count ~= -1 then
--     local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
--     range = {
--       start = { args.line1, 0 },
--       ["end"] = { args.line2, end_line:len() },
--     }
--   end
--   require("conform").format({ async = false, lsp_format = "fallback", range = range })
-- end, { range = true })

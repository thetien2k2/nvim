vim.g.mapleader = " "
vim.g.maplocalleader = " "
local cscheme = "tokyonight"

require "options"

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local cscheme = "tokyonight"
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
  },
  install = {
	  colorscheme =  {cscheme} ,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- "2html_plugin",
        -- "tohtml",
        -- "getscript",
        -- "getscriptPlugin",
        -- "gzip",
        -- "logipat",
        -- "netrw",
        -- "netrwPlugin",
        -- "netrwSettings",
        -- "netrwFileHandlers",
        -- "matchit",
        -- "tar",
        -- "tarPlugin",
        -- "rrhelper",
        -- "spellfile_plugin",
        -- "vimball",
        -- "vimballPlugin",
        -- "zip",
        -- "zipPlugin",
        "tutor",
        -- "rplugin",
        -- "syntax",
        -- "synmenu",
        -- "optwin",
        -- "compiler",
        -- "bugreport",
        -- "ftplugin",
      },
    },
  },
})

vim.cmd({cmd='colorscheme', args={cscheme}})
require "mappings"
require "autocmds"

---@diagnostic disable: undefined-global
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamed"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.scrolloff = 10
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.laststatus = 3
vim.g.netrw_liststyle = 3
-- vim.opt.list = true
-- vim.opt.listchars = { tab = " ", trail = "󰇘", nbsp = "󱁐" }
-- vim.opt.fillchars = { eob = " " }
-- vim.opt.numberwidth = 2
-- vim.opt.ruler = false
-- vim.opt.shortmess:append "sI"
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- vim.opt.whichwrap:append "<>[]hl"
-- vim.opt.linebreak = true

vim.wo.foldmethod = "manual"
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 3
vim.o.completeopt = "menuone,noselect,noinsert,popup"

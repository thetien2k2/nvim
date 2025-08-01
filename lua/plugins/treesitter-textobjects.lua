return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = false,
  branch = "main",
  -- config = function()
  --   require("nvim-treesitter.configs").setup {
  --     textobjects = {
  --       select = {
  --         enable = true,
  --
  --         -- Automatically jump forward to textobj, similar to targets.vim
  --         lookahead = true,
  --         keymaps = {
  --           -- You can use the capture groups defined in textobjects.scm
  --           ["a="] = { query = "@assignment.outer", desc = "outer ssignment" },
  --           ["i="] = { query = "@assignment.inner", desc = "inner ssignment" },
  --           ["l="] = { query = "@assignment.lhs", desc = "left assignment" },
  --           ["r="] = { query = "@assignment.rhs", desc = "right assignment" },
  --           ["aa"] = { query = "@parameter.outer", desc = "outer argument" },
  --           ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
  --           ["ai"] = { query = "@conditional.outer", desc = "outer conditional" },
  --           ["ii"] = { query = "@conditional.inner", desc = "inner conditional" },
  --           ["al"] = { query = "@loop.outer", desc = "outer loop" },
  --           ["il"] = { query = "@loop.inner", desc = "inner loop" },
  --           ["af"] = { query = "@call.outer", desc = "outer function call" },
  --           ["if"] = { query = "@call.inner", desc = "inner function call" },
  --           ["am"] = { query = "@function.outer", desc = "outer method/function" },
  --           ["im"] = { query = "@function.inner", desc = "inner method/function" },
  --           ["ac"] = { query = "@class.outer", desc = "outer class" },
  --           ["ic"] = { query = "@class.inner", desc = "inner class" },
  --         },
  --       },
  --       swap = {
  --         enable = true,
  --         swap_next = {
  --           ["gsa"] = "@parameter.inner", -- swap parameters/argument with next
  --           ["gsm"] = "@function.outer",  -- swap function with next
  --         },
  --         swap_previous = {
  --           ["gsA"] = "@parameter.inner", -- swap parameters/argument with prev
  --           ["gsM"] = "@function.outer",  -- swap function with previous
  --         },
  --       },
  --       lsp_interop = {
  --         enable = true,
  --         peek_definition_code = {
  --           ["gsf"] = "@function.outer",
  --           ["gsc"] = "@class.outer",
  --         },
  --       },
  --       move = {
  --         enable = true,
  --         set_jumps = true, -- whether to set jumps in the jumplist
  --         goto_next_start = {
  --           ["]f"] = { query = "@call.outer", desc = "function start" },
  --           ["]m"] = { query = "@function.outer", desc = "method/function def start" },
  --           ["]c"] = { query = "@class.outer", desc = "class start" },
  --           ["]i"] = { query = "@conditional.outer", desc = "conditional start" },
  --           ["]l"] = { query = "@loop.outer", desc = "loop start" },
  --
  --           -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
  --           -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
  --           ["]s"] = { query = "@scope", query_group = "locals", desc = "scope" },
  --           ["]z"] = { query = "@fold", query_group = "folds", desc = "fold" },
  --         },
  --         goto_next_end = {
  --           ["]F"] = { query = "@call.outer", desc = "function call end" },
  --           ["]M"] = { query = "@function.outer", desc = "method/function def end" },
  --           ["]C"] = { query = "@class.outer", desc = "class end" },
  --           ["]I"] = { query = "@conditional.outer", desc = "conditional end" },
  --           ["]L"] = { query = "@loop.outer", desc = "loop end" },
  --         },
  --         goto_previous_start = {
  --           ["[f"] = { query = "@call.outer", desc = "function call start" },
  --           ["[m"] = { query = "@function.outer", desc = "method/function def start" },
  --           ["[c"] = { query = "@class.outer", desc = "class start" },
  --           ["[i"] = { query = "@conditional.outer", desc = "conditional start" },
  --           ["[l"] = { query = "@loop.outer", desc = "loop start" },
  --         },
  --         goto_previous_end = {
  --           ["[F"] = { query = "@call.outer", desc = "function call end" },
  --           ["[M"] = { query = "@function.outer", desc = "method/function def end" },
  --           ["[C"] = { query = "@class.outer", desc = "class end" },
  --           ["[I"] = { query = "@conditional.outer", desc = "conditional end" },
  --           ["[L"] = { query = "@loop.outer", desc = "loop end" },
  --         },
  --       },
  --     },
  --   }
  --
  --   local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
  --   -- vim way: ; goes to the direction you were moving.
  --   vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
  --   vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
  --   -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  --   vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
  --   vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
  --   vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
  --   vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  -- end,
}

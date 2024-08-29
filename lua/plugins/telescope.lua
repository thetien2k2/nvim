---@diagnostic disable: undefined-global
return {
  "nvim-telescope/telescope.nvim",
  enabled=false,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require "telescope.builtin"
    local map = vim.keymap.set
    map("n", "<leader><leader>", builtin.buffers, { desc = "select buffers" })
    map({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "word or selection" })
    map("n", "<leader>sf", builtin.find_files, { desc = "files" })
    map("n", "<leader>so", builtin.oldfiles, { desc = "old files" })
    map("n", "<leader>sC", builtin.commands, { desc = "commands" })
    map("n", "<leader>sc", builtin.command_history, { desc = "command history" })
    map("n", "<leader>ss", builtin.search_history, { desc = "search history" })
    map("n", "<leader>sh", builtin.help_tags, { desc = "help tags" })
    map("n", "<leader>s`", builtin.marks, { desc = "marks" })
    map("n", "<leader>sq", builtin.quickfix, { desc = "quickfix" })
    map("n", "<leader>sQ", builtin.quickfixhistory, { desc = "quickfix history" })
    map("n", "<leader>sl", builtin.loclist, { desc = "location" })
    map("n", "<leader>sj", builtin.jumplist, { desc = "jump" })
    map("n", "<leader>sO", builtin.vim_options, { desc = "vim options" })
    map("n", '<leader>s"', builtin.registers, { desc = "registers" })
    map("n", "<leader>sa", builtin.autocommands, { desc = "autocommands" })
    map("n", "<leader>sz", builtin.current_buffer_fuzzy_find, { desc = "fuzzy current buffer" })
    map("n", "<leader>sk", builtin.keymaps, { desc = "keymaps" })
    map("n", "<leader>s.", builtin.resume, { desc = "resume" })
    map("n", "<leader>sp", builtin.pickers, { desc = "previous pickers" })
    map("n", "<leader>sb", builtin.builtin, { desc = "pickers" })
    map("n", "<leader>st", builtin.treesitter, { desc = "treesitter nodes" })
    map("n", "<leader>se", builtin.colorscheme, { desc = "colorscheme" })
  end,
}

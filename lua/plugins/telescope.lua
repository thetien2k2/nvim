return {
  "nvim-telescope/telescope.nvim",
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
    map("n", "<leader><leader>", builtin.buffers, { desc = "buffers" })
    map({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "word or selection" })
    map("n", "<leader>ff", builtin.find_files, { desc = "files" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "old files" })
    map("n", "<leader>fC", builtin.commands, { desc = "commands" })
    map("n", "<leader>fc", builtin.command_history, { desc = "command history" })
    map("n", "<leader>fs", builtin.search_history, { desc = "search history" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
    map("n", "<leader>f`", builtin.marks, { desc = "marks" })
    map("n", "<leader>fq", builtin.quickfix, { desc = "quickfix" })
    map("n", "<leader>fQ", builtin.quickfixhistory, { desc = "quickfix history" })
    map("n", "<leader>fl", builtin.loclist, { desc = "location" })
    map("n", "<leader>fj", builtin.jumplist, { desc = "jump" })
    map("n", "<leader>fO", builtin.vim_options, { desc = "vim options" })
    map("n", '<leader>f"', builtin.registers, { desc = "registers" })
    map("n", "<leader>fa", builtin.autocommands, { desc = "autocommands" })
    map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "fuzzy current buffer" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "keymaps" })
    map("n", "<leader>f.", builtin.resume, { desc = "keymaps" })
    map("n", "<leader>fp", builtin.pickers, { desc = "previous pickers" })
    map("n", "<leader>fb", builtin.builtin, { desc = "pickers" })
    map("n", "<leader>ft", builtin.treesitter, { desc = "treesitter nodes" })
  end,
}

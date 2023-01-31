return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  opts = function()
    local telescope = require "telescope"
    telescope.setup {
      defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<C-h>"] = "which_key",
          },
        },
        layout_strategy = "vertical",
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
      pickers = {
        buffers = {
          theme = "dropdown",
          sort_lastused = true,
          previewer = false,
        },
        git_status = {
          theme = "dropdown",
          previewer = false,
          path_display = { "absolute" },
        },
        git_files = {
          theme = "dropdown",
          previewer = false,
          path_display = { "absolute" },
        },
      },
    }
    telescope.load_extension "fzf"
    telescope.load_extension "notify"
  end,

  keys = {
    { "<C-p>", '<cmd>lua R("nv.telescope_utils").find_files()<cr>', desc = "Open Telescope to select files" },
    { "<leader>x", '<cmd>lua R("telescope.builtin").buffers()<cr>', desc = "List buffers" },
    { "<leader>a", '<cmd>lua R("nv.telescope_utils").live_grep()<cr>', desc = "Live grep" },
    { "<leader>tg", '<cmd>lua R("telescope.builtin").git_files()<cr>', desc = "Git files" },
    { "<leader>ts", '<cmd>lua R("telescope.builtin").git_status()<cr>', desc = "Git files modified" },
    { "<leader>th", '<cmd>lua R("telescope.builtin").help_tags()<cr>', desc = "Help tags" },
    { "<leader>tt", '<cmd>lua R("nv.telescope_utils").todo()<cr>', desc = "ToDo" },
    -- { "<leader>d", '<cmd>lua R("nv.telescope_utils").file_browser()<cr>', desc = "File Browser" },
    {
      "<leader>tq",
      '<cmd>lua R("nv.telescope_utils").find_files_relative()<CR>',
      desc = "File Browser relative to current file",
    },
    --[[ { "<leader>td", "<cmd>LfWorkingDirectory<cr>", desc = "File Browser" }, ]]
    { "<leader>tr", "<cmd>Lf<cr>", desc = "File Browser" },
    { "<leader>to", "<cmd>lua R('telescope.builtin').oldfiles()<cr>", desc = "Find recently opened files" },
    { "<localleader>n", '<cmd>lua R("nv.telescope_utils").edit_neovim()<cr>', desc = "Edit Neovim files" },
    {
      "<c-r><c-r>",
      "<Plug>(TelescopeFuzzyCommandSearch)",
      noremap = false,
      nowait = true,
      mode = "c",
      desc = "FuzyFind command history",
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",

        winblend = 0,
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_strategy = "horizontal",
        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
            ["<C-h>"] = "which_key",
          },
        },
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
        lsp_references = { theme = "dropdown" },
        lsp_code_actions = { theme = "dropdown" },
        lsp_definitions = { theme = "dropdown" },
        lsp_implementations = { theme = "dropdown" },
        buffers = {
          sort_lastused = true,
          previewer = false,
        },
      },
    })
    telescope.load_extension "fzf"
    telescope.load_extension "notify"
  end
}


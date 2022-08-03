local M = {}
local themes = require "telescope.themes"
local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 10,
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.80,
      height = 0.85,
      -- preview_cutoff = 120,
      prompt_position = "top",

      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<esc>"] = actions.close,
        ["<C-f>"] = function(prompt_bufnr)
          local orig_value = require("telescope.config").values.path_display
          P(orig_value)
          orig_value = { "shorten" }
        end,
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
}
require("telescope").load_extension "fzf"
require("telescope").load_extension "harpoon"

function M.find_files()
  local opts = {
    mappings = {
      n = {
        ["ff"] = function(prompt_bufnr)
          P('hola')
          local action_state = require "telescope.actions.state"
          local picker = action_state.get_current_picker(prompt_bufnr)
          P(picker)
        end,
      },
    },
  }
  require("telescope.builtin").find_files(opts)
end

function M.buffers()
  local opts = themes.get_dropdown {
    previewer = false,
    shorthen_path = false,
    layout_config = {
      prompt_position = "top",
    },
  }
  require("telescope.builtin").buffers(opts)
end

function M.todo()
  local opts = themes.get_dropdown {
    prompt_title = "~ ToDo Notes ~",
    search_dirs = { todo = "~/pvt/notes" },
    previewer = false,
    path_display = { "tail" },
    layout_config = {
      prompt_position = "top",
    },
  }
  require("telescope.builtin").find_files(opts)
end

function M.edit_neovim()
  require("telescope.builtin").find_files {
    prompt_title = "~ neovim ~",
    cwd = "~/.config/nvim",

    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.65,
    },
    path_display = { "shorten" },
  }
end

function M.git_status()
  local opts = themes.get_dropdown {
    previewer = false,
    path_display = { "absolute" },
    layout_config = {
      prompt_position = "top",
    },
  }
  require("telescope.builtin").git_status(opts)
end

function M.git_files()
  local opts = themes.get_dropdown {
    previewer = false,
    path_display = { "absolute" },
    layout_config = {
      prompt_position = "top",
    },
  }
  require("telescope.builtin").git_files(opts)
end

function M.help_tags()
  require("telescope.builtin").help_tags()
end

function M.grep_last_search(opts)
  opts = opts or {}

  -- \<getreg\>\C
  -- -> Subs out the search things
  local register = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", ""):gsub("\\v", "")

  opts.word_match = "-w"
  opts.search = register
  opts.path_display = {
    "shorten",
  }

  require("telescope.builtin").grep_string(opts)
end

function M.live_grep()
  require("telescope.builtin").live_grep()
end

function M.lsp_workspace_symbols()
  require("telescope.builtin").lsp_workspace_symbols()
end

return setmetatable({}, {
  __index = function(_, k)
    if M[k] then
      return M[k]
    else
      return require("telescope.builtin")[k]
    end
  end,
})

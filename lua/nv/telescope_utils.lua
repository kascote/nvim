local M = {}
local themes = require "telescope.themes"
local actions = require "telescope.actions"

function M.find_files()
  local opts = themes.get_dropdown {
    previewer = false,
    shorthen_path = false,
    path_display = { "truncate" },
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)

      width = function(_, max_columns, _)
        return math.min(max_columns, 120)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines, 20)
      end,
    },
  }
  require("telescope.builtin").find_files(opts)
end

function M.find_files_relative()
  local basename = vim.fn.expand('%:h')
  local opts = themes.get_dropdown {
    prompt_title = "~ Relative Files ~",
    previewer = false,
    shorthen_path = false,
    cwd = basename,
    path_display = { "truncate" },
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)

      width = function(_, max_columns, _)
        return math.min(max_columns, 120)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines, 20)
      end,
    },
  }
  require("telescope.builtin").find_files(opts)
end

function M.buffers()
  local opts = themes.get_dropdown {
    previewer = false,
    shorthen_path = false,
    path_display = { "shorten" },
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
  require("telescope.builtin").live_grep {
    glob_pattern = { "!package-lock.json", "!yarn.lock" },
  }
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

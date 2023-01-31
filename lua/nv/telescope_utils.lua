local M = {}
local themes = require "telescope.themes"
-- local actions = require "telescope.actions"
-- local Utils = require "nv.utils"

function M.find_files()
  require("telescope.builtin").find_files {}
end

function M.find_files_relative()
  local basename = vim.fn.expand "%:h"
  local opts = {
    prompt_title = "~ Relative Files ~",
    cwd = basename,
  }
  require("telescope.builtin").find_files(opts)
end

function M.todo()
  local opts = themes.get_dropdown {
    prompt_title = "~ ToDo Notes ~",
    cwd = "~/Documents/notes",
    -- search_dirs = { todo = "~/Documents/notes" },
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

function M.live_grep()
  require("telescope.builtin").live_grep {
    glob_pattern = { "!package-lock.json", "!yarn.lock", "!pnpm-lock.yaml" },
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

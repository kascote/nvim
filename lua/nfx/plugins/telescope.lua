local M = {}
local themes = require('telescope.themes')

require('telescope').setup {
  defaults = {
    prompt_prefix = '❯ ',
    selection_caret = '❯ ',

    winblend = 0,
    preview_cutoff = 120,
    prompt_position = "top",

    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },
  }
}

function M.buffers()
  local opts = themes.get_dropdown {
    border = true,
    previewer = false,
    shorthen_path = false,
  }
  require('telescope.builtin').buffers(opts)
end

function M.todo()
  local opts = themes.get_dropdown {
    prompt_title = "~ ToDo Notes ~",
    search_dirs = {todo = '~/pvt/notes'},
    border = true,
    previewer = false,
    shorthen_path = false
  }
  require('telescope.builtin').find_files(opts)
end

function M.edit_neovim()
  require('telescope.builtin').find_files {
    prompt_title = "~ neovim ~",
    shorten_path = false,
    cwd = "~/.config/nvim",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.git_status()
  local opts = themes.get_dropdown {
    border = true,
    previewer = false,
    shorthen_path = false,
  }
  require('telescope.builtin').git_status(opts)
end

function M.grep_last_search(opts)
  opts = opts or {}

  -- \<getreg\>\C
  -- -> Subs out the search things
  local register = vim.fn.getreg('/'):gsub('\\<', ''):gsub('\\>', ''):gsub("\\C", ""):gsub("\\v", "")

  opts.shorten_path = true
  opts.word_match = '-w'
  opts.search = register

  require('telescope.builtin').grep_string(opts)
end

return setmetatable({}, {
  __index = function(_, k)

    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})


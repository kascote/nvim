vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" } -- empty by defaul
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1

-- vim.g.nvim_tree_icons = {
--   default        = '',
--   symlink        = '◎',
--   git            = {
--     unstaged     = "✗",
--     staged       = "✓",
--     unmerged     = "ϟ",
--     renamed      = "➜",
--     untracked    = "★"
--   },
--   folder         = {
--     default      = "▶",
--     open         = "▼",
--     empty        = "▷",
--     empty_open   = "▽",
--     symlink      = "▣",
--     symlink_open = "▢",
--   }
-- }

require("nvim-tree").setup {
  diagnostics = {
    enable = true,
    -- icons = { hint = "", info = "", warning = "", error = "" },
  },
  view = {
    width = 40,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {},
    },
  },
}

-- let g:NERDTreeIgnore=['\.orig']
-- The default of 31 is just a little too narrow.
-- vim.g.NERDTreeWinSize=45
-- -- Disable display of '?' text and 'Bookmarks' label.
-- vim.g.NERDTreeMinimalUI=1
-- -- Single-click to toggle directory nodes, double-click to open non-directory nodes.
-- vim.g.NERDTreeMouseMode=2
-- vim.g.NERDTreeHighlightCursorline=1
-- -- close after open
-- vim.g.NERDTreeQuitOnOpen=3
-- vim.g.NERDTreeRespectWildIgnore=1
-- vim.g.NERDTreeAutoDeleteBuffer=1

vim.g.nvim_tree_width = 40 
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by defaul
-- vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_icons = {
  default        = '',
  symlink        = '◎',
  git            = {
    unstaged     = "✗",
    staged       = "✓",
    unmerged     = "ϟ",
    renamed      = "➜",
    untracked    = "★"
  },
  folder         = {
    default      = "▶",
    open         = "▼",
    empty        = "▷",
    empty_open   = "▽",
    symlink      = "▣",
    symlink_open = "▢",
  }
}

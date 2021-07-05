vim.o.background = "dark"

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {
  "qf",
  "terminal",
  "packer",
  "help",
}

require("tokyonight").colorscheme()

vim.cmd([[hi! link TabLineSel Special]])
-- vim.cmd('colorscheme tokyonight')

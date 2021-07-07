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
vim.cmd([[hi! TabLineMod guifg=#f7768e]])
vim.cmd([[hi! TabLineModBuf guifg=#9ece6a]])
vim.cmd([[hi! TabLineModNone guifg=#bb9af7]]) -- 1a1b26

-- vim.cmd('colorscheme tokyonight')

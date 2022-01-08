vim.o.background = "dark"

local clrFloat = "#15161E"

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {
  "qf",
  "terminal",
  "packer",
  "help",
}
vim.g.tokyonight_colors = {
  bg_float = clrFloat,
}

vim.cmd [[colorscheme tokyonight]]

vim.cmd [[hi! link TabLineSel Special]]
vim.cmd [[hi! TabLine guifg=#545c7e]]
vim.cmd [[hi! TabLineMod guifg=#f7768e]]
vim.cmd [[hi! TabLineModBuf guifg=#9ece6a]]
vim.cmd [[hi! TabLineModNone guifg=#bb9af7]]

vim.cmd [[hi! link markdownError Error]]



vim.cmd(string.format("hi TelescopeNormal guibg=%s", clrFloat))
vim.cmd(string.format("hi TelescopeBorder guibg=%s", clrFloat))

-- vim.cmd('colorscheme tokyonight')

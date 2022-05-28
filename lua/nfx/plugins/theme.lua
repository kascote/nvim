vim.o.background = "dark"

-- local clrFloat = "#15161E"
local clrFloat = "#111111"

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {
  "qf",
  "terminal",
  "packer",
  "help",
}
vim.g.tokyonight_colors = {
  bg_float = clrFloat,
  bg = "#12131a", -- "#0a0a0f" -- orig #1a1b26
}

-- local config = require("tokyonight.config")
-- local colors = require("tokyonight.colors")
local hc = vim.highlight.create
local hl = vim.highlight.link
-- local c = colors.setup(config)

vim.cmd [[colorscheme tokyonight]]

hl("TabLineSel", "Special", true)
hc("TabLine", { guifg = "#545c7e" })
hc("TabLineMod", { guifg = "#f7768e" })
hc("TabLineModBuf", { guifg = "#9ece6a" })
hc("TabLineModNone", { guifg = "#bb9af7" })

hl("markdownError", "Error", true)
hc("Pmenu", { guibg = "#111111" })

hc("TelescopeNormal", { guibg = clrFloat })
hc("TelescopeBorder", { guibg = clrFloat })

hc("VertSplit", { guifg = "#414868" })

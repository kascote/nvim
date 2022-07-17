local hl = vim.api.nvim_set_hl

vim.o.background = "dark"

-- TokyoNight --
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
  bg = "#0a0a0f" -- "#12131a", -- orig #1a1b26
}

-- local config = require("tokyonight.config")
-- local colors = require("tokyonight.colors")
-- local c = colors.setup(config)

vim.cmd "colorscheme tokyonight"

hl(0, "TabLineSel", { link = "Special" })
hl(0, "TabLine", { fg = "#545c7e" })
hl(0, "TabLineMod", { fg = "#f7768e" })
hl(0, "TabLineModBuf", { fg = "#9ece6a" })
hl(0, "TabLineModNone", { fg = "#bb9af7" })

hl(0, "markdownError", { link = "Error" })
hl(0, "Pmenu", { bg = "#111111" })

hl(0, "TelescopeNormal", { bg = clrFloat })
hl(0, "TelescopeBorder", { bg = clrFloat })

hl(0, "VertSplit", { fg = "#414868" })
hl(0, "CursorLine", { bg = '#12121C'})

--[[ Catppuccin ]]
--

--[[ vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd "colorscheme catppuccin"

hl(0, "CursorLine", { guibg = '#12121C'}) ]]

local m = require("mono.mono")

m.setup {
  base00 = "#101010", -- #16161D",
  base01 = "#3e4451",
  base02 = "#2c313c",
  base03 = "#565c64",
  base04 = "#6c7891",
  base05 = "#abb2bf",
  base06 = "#9a9bb3",
  base07 = "#c5c8e6",
  red = "#e06c75",
  orange = "#d19a66", -- "#ffa500"
  yellow = "#e5c07b", -- "#cccc00"
  green = "#98c379",
  cyan = "#56b6c2", -- #00e6e6
  blue = "#0184bc",
  magenta = "#c678dd",
  brown = "#a06949",
}

local hl = vim.api.nvim_set_hl
local magenta = "#74519b"
local magenta_darker = "#20142d"

local commentHL = { fg = magenta, bg = magenta_darker, italic = true }
hl(0, "Comment", commentHL)
hl(0, "gitcommitComment", commentHL)
hl(0, "TSComment", commentHL)

hl(0, "StatusLineDiffAdd", { fg = m.colors.green, bg = m.colors.base02 })
hl(0, "StatusLineDiffDel", { fg = m.colors.red, bg = m.colors.base02 })
hl(0, "StatusLineDiffChg", { fg = m.colors.yellow, bg = m.colors.base02 })
hl(0, "StatusLineFilename", { fg = m.colors.base04, bg = m.colors.base02 })
hl(0, "StatusLineFilenameHi", { fg = m.colors.base05, bg = m.colors.base02 })


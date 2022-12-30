local m = require "mono.mono"

m.setup {
  base00 = "#101010", -- #16161D",
  base11 = "#1f1f1f",
  base01 = "#3e4451",
  base02 = "#2c313c",
  base03 = "#565c64",
  base04 = "#6c7891",
  base05 = "#abb2bf",
  base06 = "#9a9bb3",
  base07 = "#c5c8e6",
  base09 = "#e6e6e6",
  base0A = "#f5f5f5",
  red = "#ff0088", -- #e06c75",
  orange = "#ff7800", -- #d19a66", -- "#ffa500"
  yellow = "#fff700", -- #e5c07b", -- "#cccc00"
  green = "#88ff00", -- #98c379",
  cyan = "#00fff7", -- #56b6c2", -- #00e6e6
  blue = "#0088ff", -- #0184bc",
  magenta = "#f700ff", -- "#c678dd", -- "#74519b" "#20142d"
  primary = "#ff0088",
}

local hl = vim.api.nvim_set_hl
local commentHL = { fg = m.colors.base04, bg = m.colors.base11, italic = true }

hl(0, "Comment", commentHL)
hl(0, "gitcommitComment", commentHL)
hl(0, "TSComment", commentHL)

hl(0, "StatusLineDiffAdd", { fg = m.colors.green, bg = m.colors.base02 })
hl(0, "StatusLineDiffDel", { fg = m.colors.red, bg = m.colors.base02 })
hl(0, "StatusLineDiffChg", { fg = m.colors.yellow, bg = m.colors.base02 })
hl(0, "StatusLineFilename", { fg = m.colors.base04, bg = m.colors.base02 })
hl(0, "StatusLineFilenameHi", { fg = m.colors.base05, bg = m.colors.base02 })

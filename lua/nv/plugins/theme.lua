local hl = vim.api.nvim_set_hl

vim.o.background = "dark"

-- TokyoNight --
--[[ local clrFloat = "#111111"

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
hl(0, "CursorLine", { bg = '#12121C'}) ]]

--[[ Catppuccin ]]

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd "colorscheme catppuccin"

hl(0, "Normal", { bg = "#11111B" }) -- 07070a
hl(0, "CursorLine", { bg = "#11111B" })
hl(0, "SignColumn", { bg = "#11111B" })
hl(0, "Cursor", { fg = "#000000", bg = "#f38ba8" })

hl(0, "TelescopePreviewNormal", { bg = "#11111B" })
hl(0, "TelescopeResultsNormal", { bg = "#11111B" })
hl(0, "TelescopePromptNormal", { bg = "#11111B" })

hl(0, "WinBar", { link = "StatusLine" })
-- hl(0, "WinBar", { bg = "#313244", fg = "#11111B" })
-- hl(0, "WinBarNC", { bg = "#11111B", fg = "#323244" })

--[[ hl(0, "NavicIconsFile", { link = "CmpItemKindFile" })
hl(0, "NavicIconsModule", { link = "CmpItemKindModule" })
hl(0, "NavicIconsNamespace", { link = "CmpItemKindUnit" })
hl(0, "NavicIconsPackage", { link = "CmpItemKindUnit" })
hl(0, "NavicIconsClass", { link = "CmpItemKindClass" })
hl(0, "NavicIconsMethod", { link = "CmpItemKindMethod" })
hl(0, "NavicIconsProperty", { link = "CmpItemKindProperty" })
hl(0, "NavicIconsField", { link = "CmpItemKindField" })
hl(0, "NavicIconsConstructor", { link = "CmpItemKindConstructor" })
hl(0, "NavicIconsEnum", { link = "CmpItemKindEnum" })
hl(0, "NavicIconsInterface", { link = "CmpItemKindInterface" })
hl(0, "NavicIconsFunction", { link = "CmpItemKindFunction" })
hl(0, "NavicIconsVariable", { link = "CmpItemKindVariable" })
hl(0, "NavicIconsConstant", { link = "CmpItemKindConstant" })
hl(0, "NavicIconsString", { link = "CmpItemKindValue" })
hl(0, "NavicIconsNumber", { link = "CmpItemKindValue" })
hl(0, "NavicIconsBoolean", { link = "CmpItemKindValue" })
hl(0, "NavicIconsArray", { link = "CmpItemKindProperty" })
hl(0, "NavicIconsObject", { link = "CmpItemKindProperty" })
hl(0, "NavicIconsKey", { link = "CmpItemKindKeyword" })
hl(0, "NavicIconsNull", { link = "CmpItemKindField" })
hl(0, "NavicIconsEnumMember", { link = "CmpItemKindValue" })
hl(0, "NavicIconsStruct", { link = "CmpItemKindStruct" })
hl(0, "NavicIconsEvent", { link = "CmpItemKindEvent" })
hl(0, "NavicIconsOperator", { link = "CmpItemKindOperator" })
hl(0, "NavicIconsTypeParameter", { link = "CmpItemKindTypeParameter" })
hl(0, "NavicText", { link = "Normal" })
hl(0, "NavicSeparator", { link = "Normal" })
hl(0, "NavicFileName", { fg = "#7f849c", bg="#181825", italic=true }) ]]

hl(0, "StatusLineDiffAdd", { fg = "#a6e3a1", bg = "#313244" })
hl(0, "StatusLineDiffDel", { fg = "#f38ba8", bg = "#313244" })
hl(0, "StatusLineDiffChg", { fg = "#f9e2af", bg = "#313244" })
hl(0, "StatusLineFilename", { fg = "#6c7086" })
hl(0, "StatusLineFilenameHi", { fg = "#f9e2af" })

hl(0, "LspReferenceRead", { bg = "#464646" })
hl(0, "LspReferenceText", { bg = "#164646" })
hl(0, "LspReferenceWrite", { bg = "#964646" })

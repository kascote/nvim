-- TokyoNight --

_G.nfx.setupTokyoNight = function()
  local bgBlack = "#111111"

  require("tokyonight").setup {
    style = "night",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    sidebars = { "qf", "help", "lf", "packer", "terminal" },
    dim_inactive = false,

    on_colors = function(colors)
      --[[ P(colors) ]]
      colors.bg = "#0a0a0f" -- "#12131a", -- orig #1a1b26
      colors.border = "#394b70"
      --[[ colors.bg_float = bgBlack ]]
    end,

    on_highlights = function(hl, c)
      hl.Comment = { fg = "#74519b", bg = "#20142d" }
      hl.TabLineSel = { link = "Special" }
      hl.TabLine = { fg = "#545c7e", bg = c.bg_dark }
      hl.TabLineMod = { fg = "#f7768e", bg = c.bg_dark }
      hl.TabLineModBuf = { fg = "#9ece6a", bg = c.bg_dark }
      hl.TabLineModNone = { fg = "#bb9af7", bg = c.bg_dark }

      hl.markdownError = { link = "Error" }
      hl.Pmenu = { bg = bgBlack }

      hl.TelescopeNormal = { bg = bgBlack }
      hl.TelescopeBorder = { fg = c.dark3, bg = bgBlack }

      hl.VertSplit = { fg = "#414868" }
      hl.CursorLine = { bg = "#12121C" }

      hl.StatusLineDiffAdd = { fg = "#a6e3a1", bg = c.bg_dark }
      hl.StatusLineDiffDel = { fg = "#f38ba8", bg = c.bg_dark }
      hl.StatusLineDiffChg = { fg = "#f9e2af", bg = c.bg_dark }
      hl.StatusLineFilename = { fg = "#6c7086", bg = c.bg_dark }
      hl.StatusLineFilenameHi = { fg = "#f9e2af", bg = c.bg_dark }
    end,
  }

  vim.cmd [[colorscheme tokyonight-night]]
end

--[[ Catppuccin ]]

_G.nfx.setupMocha = function()
  vim.o.background = "dark"
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  vim.cmd [[colorscheme catppuccin]]
  local hl = vim.api.nvim_set_hl

  local mocha = require("catppuccin.palettes").get_palette "mocha"

  hl(0, "Normal", { bg = "#07070a" }) -- 07070a
  hl(0, "CursorLine", { bg = "#11111B" })
  hl(0, "SignColumn", { bg = "#11111B" })
  hl(0, "Cursor", { fg = "#000000", bg = "#f38ba8" })
  --[[ hl(0, "Comment", { fg = "#ffeaf4", bg = "#d6066f" }) ]]
  hl(0, "Comment", { fg = "#74519b", bg = "#20142d" }) -- #573d74

  hl(0, "TelescopePreviewNormal", { bg = "#11111B" })
  hl(0, "TelescopeResultsNormal", { bg = "#11111B" })
  hl(0, "TelescopePromptNormal", { bg = "#11111B" })

  hl(0, "WinBar", { link = "StatusLine" })
  --[[ hl(0, "WinBar", { bg = "#313244", fg = "#11111B" }) ]]
  --[[ hl(0, "WinBarNC", { bg = "#11111B", fg = "#323244" }) ]]

  hl(0, "StatusLineDiffAdd", { fg = "#a6e3a1", bg = "#313244" })
  hl(0, "StatusLineDiffDel", { fg = "#f38ba8", bg = "#313244" })
  hl(0, "StatusLineDiffChg", { fg = "#f9e2af", bg = "#313244" })
  hl(0, "StatusLineFilename", { fg = "#6c7086" })
  hl(0, "StatusLineFilenameHi", { fg = "#f9e2af" })

  hl(0, "LspReferenceRead", { bg = "#464646" })
  hl(0, "LspReferenceText", { bg = "#164646" })
  hl(0, "LspReferenceWrite", { bg = "#964646" })

  hl(0, "htmlTSString", { fg = mocha.blue, underline = false })
  hl(0, "htmlTSText", { fg = mocha.yellow, underline = false })
  vim.defer_fn(function()
    vim.api.nvim_set_hl(0, "htmlTSURI", {}) -- remove htmlTSURI => TSURI link
  end, 100)
end

_G.nfx.setupLatte = function()
  vim.o.background = "light"
  vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
  vim.cmd "colorscheme catppuccin"
  local hl = vim.api.nvim_set_hl

  --[[ hl(0, "Normal", { bg = "#dce0e8" }) ]]
  hl(0, "Cursor", { fg = "#FFFFCC", bg = "#FF0000" })
  hl(0, "Comment", { fg = "#74519b", bg = "#dfcafb" })
  --[[ hl(0, "Pmenu", { fg = "#4c4f69", bg = "#eff1f5" })  ]]
end

--[[ nfx.setupMocha() ]]
nfx.setupTokyoNight()

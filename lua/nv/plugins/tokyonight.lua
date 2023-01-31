return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = function()
    return {
      style = "night",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      sidebars = { "qf", "help", "lf", "lazy", "man", "notify", "tsplayground", "lspinfo" },
      dim_inactive = false,
      on_colors = function(colors)
        colors.bg = "#0a0a0f" -- "#12131a", -- orig #1a1b26
        colors.border = "#394b70"
      end,
      on_highlights = function(hl, c)
        -- hl.CursorLineNr = { fg = c.orange, bold = true }
        hl.LineNr = { fg = c.orange, bold = true }
        hl.Comment = { fg = "#74519b", bg = "#20142d" }
        hl.TabLineMod = { fg = "#f7768e", bg = c.bg_dark }
        hl.TabLineModBuf = { fg = "#9ece6a", bg = c.bg_dark }
        hl.TabLineModNone = { fg = "#bb9af7", bg = c.bg_dark }
        -- hl.IndentBlanklineChar = { fg = c.fg_gutter, nocombine = true }
        hl.IndentBlanklineChar = { fg = "#222222", nocombine = true }
        hl.IndentBlanklineContextChar = { fg = c.purple, nocombine = true }
      end,
    }
  end,
  config = function(plugin, opts)
    require("tokyonight").setup(opts)
    vim.cmd [[colorscheme tokyonight-night]]
  end,
}

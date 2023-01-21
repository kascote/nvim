local m = require "mono.mono"

m.setup(m.colorschemes.noir)

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

hl(0, "IndentBlanklineContextChar", { fg = m.colors.base04 })
hl(0, "IndentBlanklineIndent1", { fg = m.colors.base02 })

hl(0, "NormalSB", { bg = m.colors.base11 })
hl(0, "SignColumnSB", { bg = m.colors.base11 })
hl(0, "NormalFloatSB", { bg = m.colors.base11 })
hl(0, "WhichKeyFloat", { bg = m.colors.base11 })

hl(0, "TSTitle", { fg = m.colors.green })
hl(0, "TSLabel", { fg = m.colors.blue })

local sidebars = {
  "help",
  "qf",
  "terminal",
  "lazy",
  "lspinfo",
  "tsplayground"
}

local colorAuCmd = vim.api.nvim_create_augroup("ThemeNoir", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  -- command = [[setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB,NormalFloat:NormalFloatSB]],
  callback = function ()
    vim.defer_fn(function()
      vim.cmd[[setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB,NormalFloat:NormalFloatSB]]
    end, 50)
  end,
  group = colorAuCmd,
  pattern = table.concat(sidebars, ","),
})

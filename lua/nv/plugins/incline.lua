local M = {
  "b0o/incline.nvim",
  event = "BufReadPre",
}

function M.config()
  require("incline").setup {
    highlight = {
      groups = {
        InclineNormal = {
          guibg = "#BF4186", -- FC56B1",
          guifg = "#202020",
          -- gui = "bold",
        },
        InclineNormalNC = {
          guifg = "#888888",
          guibg = "#303030",
        },
      },
    },
    window = {
      margin = {
        vertical = 0,
        horizontal = 1,
      },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      local icon = require("nv.icons").codicon.circleFilled
      return {
        -- { icon, guifg = nil },
        -- { " " },
        { filename },
      }
    end,
  }
end

return M

local M = {
  "L3MON4D3/LuaSnip",
  -- dependencies = {
  --   "rafamadriz/friendly-snippets",
  --   config = function()
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --   end,
  -- },
}

function M.config()
  local snip = require "luasnip"
  local types = require "luasnip.util.types"

  snip.config.set_config {
    -- keep around the last snippet
    history = true,
    enable_autosnippets = true,
    -- update as you type
    -- updateevents = "TextChanged,TextChangedI",

    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<-", "Error" } },
        },
      },
    },
  }

  vim.defer_fn(function()
    require("nv.snipets")
  end, 100)
end

return M

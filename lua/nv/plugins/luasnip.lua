local snip = require "luasnip"
local types = require "luasnip.util.types"

snip.config.set_config {
  -- keep around the last snippet
  history = true,
  -- update as you type
  updateevents = "TextChanged,TextChangedI",

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

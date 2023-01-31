local U = require "nv.plugins.lsp.utils"

local M = {}

M.setup = function()
  require("typescript").setup {
    server = {
      on_attach = U.custom_attach,
      capabilities = U.capabilities(),
    },
  }
end

return M

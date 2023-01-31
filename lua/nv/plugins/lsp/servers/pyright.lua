local lspconfig = require "lspconfig"
local U = require "nv.plugins.lsp.utils"

local M = {}

M.setup = function()
  lspconfig.pyright.setup {
    on_init = function(client, buff)
      U.custom_init(client)
      U.set_keymap(client, buff)
    end,
    on_attach = U.custom_attach,
    capabilities = U.capabilities(),
  }
end

return M

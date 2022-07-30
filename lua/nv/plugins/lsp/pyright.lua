local lspconfig = require("lspconfig")
local U = require "nv.plugins.lsp.utils"

lspconfig.pyright.setup {
  on_init = function(client, buff)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = U.capabilities(),
}

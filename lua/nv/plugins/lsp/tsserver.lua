local lspconfig = require("lspconfig")
local U = require "nv.plugins.lsp.utils"

require("typescript").setup({
  server = {
    on_attach = U.custom_attach,
    capabilities = U.capabilities(),
  }
})

--[[ lspconfig.tsserver.setup {
  on_init = function(client, buff)
    U.disable_formatting(client)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
}
 ]]

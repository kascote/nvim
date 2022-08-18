local lspconfig = require "lspconfig"
local U = require "nv.plugins.lsp.utils"

local caps = U.capabilities()
caps.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  on_init = function(client, buff)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = caps,
  init_options = { provideFormatter = false },
  settings = {
    css = {
      lint = {
        validProperties = {},
      },
    },
  },
}

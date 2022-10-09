local lspconfig = require("lspconfig")
local U = require "nv.plugins.lsp.utils"

local caps = U.capabilities();
caps.textDocument.completion.completionItem.snippetSupport = true;

lspconfig.cssls.setup {
  on_init = function(client, buff)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = caps,
  flags = { debounce_text_changes = 150 },
}

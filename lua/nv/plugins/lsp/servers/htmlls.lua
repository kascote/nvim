local lspconfig = require "lspconfig"
local U = require "nv.plugins.lsp.utils"

local M = {}

M.setup = function()
  local caps = U.capabilities()
  caps.textDocument.completion.completionItem.snippetSupport = true

  lspconfig.html.setup {
    on_init = function(client, buff)
      U.custom_init(client)
      U.set_keymap(client, buff)
    end,
    on_attach = U.custom_attach,
    capabilities = caps,
    init_options = { provideFormatter = false },
    flags = { debounce_text_changes = 150 },
    settings = {
      html = {
        format = {
          templating = true,
          wrapLineLength = 120,
          wrapAttributes = "auto",
        },
        hover = {
          documentation = true,
          references = true,
        },
      },
      css = {
        lint = {
          validProperties = {},
        },
      },
    },
  }
end

return M

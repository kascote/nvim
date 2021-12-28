local nls = require "null-ls"
local U = require('nfx.plugins.lsp.utils')

nls.setup {
  debounce = 250,
  save_after_format = false,
  sources = {
    nls.builtins.formatting.prettier.with {
      command = "node_modules/.bin/prettier",
    },
    nls.builtins.formatting.stylua,
    nls.builtins.formatting.json_tool,
    nls.builtins.formatting.eslint.with {
      command = "node_modules/.bin/eslint",
    },
    nls.builtins.diagnostics.shellcheck,
    -- nls.builtins.diagnostics.markdownlint,
    -- nls.builtins.diagnostics.selene,
    nls.builtins.code_actions.gitsigns,
  },
  debug = false,
  log = {
    enable = false,
    level = "error", -- trace
    use_console = "async",
  },
  on_attach = function(client, buff)
    U.custom_attach(client, buff)
    U.set_keymap(buff)
  end,
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

local nls = require "null-ls"

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
    enable = true,
    level = "trace",
    use_console = "async",
  },
}

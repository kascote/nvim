local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local nls = require "null-ls"
  local U = require "nv.plugins.lsp.utils"

  nls.setup {
    debounce = 500,
    save_after_format = false,
    sources = {
      --[[ nls.builtins.formatting.prettier.with { ]]
      --[[   command = "node_modules/.bin/prettier", ]]
      --[[ }, ]]
      --[[ nls.builtins.formatting.prettier, ]]
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.json_tool,
      nls.builtins.formatting.eslint_d,
      nls.builtins.formatting.fish_indent,
      --[[ nls.builtins.formatting.eslint.with {
        command = "node_modules/.bin/eslint",
      }, ]]
      -- nls.builtins.formatting.dart_format,
      nls.builtins.diagnostics.shellcheck,
      nls.builtins.diagnostics.eslint_d,
      nls.builtins.diagnostics.cspell.with {
        diagnostics_postprocess = function(diagnostic)
          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            diagnostic.severity = vim.diagnostic.severity.INFO
          end
        end,
      },
      --[[ nls.builtins.diagnostics.eslint.with {
        command = "node_modules/.bin/eslint",
        -- args = projectSetup,
      }, ]]
      -- nls.builtins.diagnostics.markdownlint,
      nls.builtins.diagnostics.fish,
      nls.builtins.code_actions.gitsigns,
      nls.builtins.code_actions.eslint_d,
      nls.builtins.code_actions.cspell,
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

    capabilities = U.capabilities(),
  }
end

return M

local nls = require("null-ls")

local M = {}

function M.setup()
  nls.config({
    debounce = 250,
    save_after_format = false,
    sources = {
      -- nls.builtins.formatting.prettier.with({
      --   arguments = { "npx", "prettier", "--stdin-filepath", "$FILENAME" },
      -- }),
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.json_tool,
      -- nls.builtins.formatting.eslint,
      -- nls.builtins.formatting.eslint_d,
      -- nls.builtins.diagnostics.shellcheck,
      -- nls.builtins.diagnostics.markdownlint,
      -- nls.builtins.diagnostics.selene,
      nls.builtins.code_actions.gitsigns,
      -- nls.builtins.diagnostics.eslint
    },
  })
end

function M.has_formatter(ft)
  local config = require("null-ls.config")
  local formatters = config.generators("NULL_LS_FORMATTING")
  for _, f in ipairs(formatters) do
    if vim.tbl_contains(f.filetypes, ft) then
      return true
    end
  end
end

return M

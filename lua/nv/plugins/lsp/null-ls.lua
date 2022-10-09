local nls = require "null-ls"
local U = require "nv.plugins.lsp.utils"

--[[ local function projectSetup(params)
  local cfgFile = "nvprojectrc.json"
  local cfgDir = vim.fn.expand(vim.env.XDG_CONFIG_HOME or "~/")
  local json = {}
  if vim.fn.filereadable(cfgDir .. '/' .. cfgFile) > 0 then
    json = vim.fn.json_decode(vim.fn.readfile(cfgFile))
  end
  local cwd = vim.fn.getcwd()

  if json[cwd] then
    print "found"
  else
    print "not found"
  end

  return { "-c", "config/linters/.eslintrc.js", "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" }
end ]]

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
    --[[ nls.builtins.diagnostics.eslint.with {
      command = "node_modules/.bin/eslint",
      -- args = projectSetup,
    }, ]]
    -- nls.builtins.diagnostics.markdownlint,
    -- nls.builtins.diagnostics.selene,
    nls.builtins.diagnostics.fish,
    nls.builtins.code_actions.gitsigns,
    nls.builtins.code_actions.eslint_d,
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

return {
  setup = function(client)
    local ts = require "nvim-lsp-ts-utils"
    -- disable tsserver formatting
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
 
    ts.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,
      import_on_completion_timeout = 5000,
      enable_formatting = true,
      formatter = "prettier",
      -- eslint
      elint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint",
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = true,
      eslint_show_rule_id = false,
      -- eslint_fix_current = false,
    }

    ts.setup_client(client)
  end,
}

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

      -- import all
      import_all_timeout = 5000,
      import_all_priorities = {
        buffers = 4, -- loaded buffer names
        buffer_content = 3, -- loaded buffer content
        local_files = 2, -- git files or files with relative path markers
        same_file = 1, -- add to existing import statement
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- eslint
      elint_enable_code_actions = false,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint_d",
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = true,
      eslint_show_rule_id = false,
      -- eslint_fix_current = false,

      -- formatting
      enable_formatting = true,
      formatter = "prettier",
      formatter_config_fallback = nil,

      -- update imports on file move
      update_imports_on_move = true,
      require_confirmation_on_move = true,
      watch_dir = nil,
    }

    ts.setup_client(client)
  end,
}

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot-cmp",
    config = function(plugin, opts)
      opts = {
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      }
      require("copilot_cmp").setup(opts)
    end,
  },
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = false,
      auto_trigger = false,
      debounce = 75,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      javascript = true,
      typescript = true,
      javascriptreact = true,
      typescriptreact = true,
      lua = true,
      fish = true,
    },
  },
}

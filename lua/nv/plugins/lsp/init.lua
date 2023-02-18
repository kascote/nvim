local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "jose-elias-alvarez/typescript.nvim",
    -- { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    {
      "folke/neodev.nvim",
      opts = {
        pathStrict = true,
      },
    },
  },
}

function M.config()
  local U = require "nv.plugins.lsp.utils"

  --[[ IMPORTANT: make sure to setup lua-dev BEFORE lspconfig ]]
  -- require("neodev").setup {}

  local config = {
    virtual_text = false,
    signs = {
      active = U.diagnosticHighliter,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  vim.diagnostic.config(config)

  U.setupDiagnosticHighlihters()
  U.setupDiagnosticSigns()
  U.setupGlobalHandlers()

  require("nv.plugins.lsp.servers.cssls").setup()
  require("nv.plugins.lsp.servers.dart").setup()
  require("nv.plugins.lsp.servers.htmlls").setup()
  require("nv.plugins.lsp.servers.jsonls").setup()
  require("nv.plugins.lsp.servers.nlua").setup()
  require("nv.plugins.lsp.servers.pyright").setup()
  require("nv.plugins.lsp.servers.tsserver").setup()
  require("nv.plugins.lsp.servers.vimls").setup()
end

return M

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
local U = require "nv.plugins.lsp.utils"

--[[ IMPORTANT: make sure to setup lua-dev BEFORE lspconfig ]]
require("lua-dev").setup {}

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
-- vim.lsp.set_log_level "info"

U.setupDiagnosticHighlihters()
U.setupDiagnosticSigns()
U.setupGlobalHandlers()

require "nv.plugins.lsp.vimls"
require "nv.plugins.lsp.tsserver"
require "nv.plugins.lsp.nlua"
require "nv.plugins.lsp.dart"
require "nv.plugins.lsp.null-ls"
require "nv.plugins.lsp.pyright"
require "nv.plugins.lsp.cssls"
require "nv.plugins.lsp.htmlls"
require "nv.plugins.lsp.jsonls"

-- ###########################################################################
--[[
-- some interesting ideas for lsp config
  https://github.com/ssoriche/dotfiles/blob/neovim_lsp/neovim/lua/lsp/init.lua

  https://github.com/disrupted/dotfiles/blob/master/.config/nvim/lua/conf/lsp.lua

  https://github.com/MagicDuck/dotfiles
--]]

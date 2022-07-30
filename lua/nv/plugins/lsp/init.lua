local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local vim = vim
local vimLsp = vim.lsp

local diagIcons = {
  error = ' ', -- 
  warn = ' ', -- 
  hint = ' ', -- 
  info = ' ', -- 
}

local signs = {
  { name = "DiagnosticSignError", text = diagIcons.error },
  { name = "DiagnosticSignWarn", text = diagIcons.warn },
  { name = "DiagnosticSignHint", text = diagIcons.hint },
  { name = "DiagnosticSignInfo", text = diagIcons.info },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false,
  signs = {
    active = signs,
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

vimLsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vimLsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

require "nv.plugins.lsp.vimls"
require "nv.plugins.lsp.tsserver"
require "nv.plugins.lsp.nlua"
require "nv.plugins.lsp.dart"
require "nv.plugins.lsp.null-ls"
require "nv.plugins.lsp.pyright"

local dsigns = { 
  Error = diagIcons.error,
  Warning = diagIcons.warn,
  Hint = diagIcons.hint,
  Information = diagIcons.Info 
}
for type, icon in pairs(dsigns) do
  local hlLsp = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hlLsp, { text = icon, texthl = hlLsp, numhl = "" })
end

vim.cmd "hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646"
vim.cmd "hi LspReferenceText cterm=bold ctermbg=red guibg=#164646"
vim.cmd "hi LspReferenceWrite cterm=bold ctermbg=red guibg=#964646"

-- ###########################################################################
--[[
-- some interesting ideas for lsp config
  https://github.com/ssoriche/dotfiles/blob/neovim_lsp/neovim/lua/lsp/init.lua

  https://github.com/disrupted/dotfiles/blob/master/.config/nvim/lua/conf/lsp.lua

  https://github.com/MagicDuck/dotfiles
--]]

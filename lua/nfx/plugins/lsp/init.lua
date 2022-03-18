local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  vim.notify("missing lspconfig", vim.log.levels.WARN)
  return
end
local U = require "nfx.plugins.lsp.utils"
local lspconfig_util = require "lspconfig.util"

local vim = vim
local vimLsp = vim.lsp
-- vim.lsp.set_log_level "DEBUG"
-- print(vim.lsp.get_log_path())

-- vimLsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vimLsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   virtual_text = false,
--   signs = true,
--   update_in_insert = true,
-- })

local signs = {
  { name = "DiagnosticSignError", text = " " }, -- 
  { name = "DiagnosticSignWarn", text = " " }, -- 
  { name = "DiagnosticSignHint", text = " " }, -- 
  { name = "DiagnosticSignInfo", text = " " }, -- 
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = true,
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

lspconfig.vimls.setup {
  on_init = function(client, buff)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = U.capabilities(),
}

lspconfig.tsserver.setup {
  on_init = function(client, buff)
    U.disable_formatting(client)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = U.capabilities(),
}

local sumneko_root_path = vim.fn.stdpath "cache" .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

require("nlua.lsp.nvim").setup(lspconfig, {
  on_init = function(client, buff)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = U.capabilities(),
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },

  root_dir = function(fname)
    if string.find(vim.fn.fnamemodify(fname, ":p"), ".config/nvim/") then
      return vim.fn.expand "~/.config/nvim/"
    end

    return lspconfig_util.find_git_ancestor(fname) or lspconfig_util.path.dirname(fname)
  end,

  globals = { "P", "R", "RELOAD" },
})

lspconfig.dartls.setup {
  on_init = function(client, buff)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = U.capabilities(),
  cmd = {
    "dart",
    "/usr/local/opt/dart/libexec/bin/snapshots/analysis_server.dart.snapshot",
    "--lsp",
  },
  settings = {
    dart = {
      lineLength = 120,
    },
  },
}

require "nfx.plugins.lsp.null-ls"

local dsigns = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(dsigns) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
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

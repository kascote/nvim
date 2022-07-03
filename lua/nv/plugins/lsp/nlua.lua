local lspconfig = require("lspconfig")
local lspconfig_util = require "lspconfig.util"
local U = require "nv.plugins.lsp.utils"

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

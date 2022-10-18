local lspconfig = require "lspconfig"
local lspconfig_util = require "lspconfig.util"
local U = require "nv.plugins.lsp.utils"

local sumneko_root_path = "/opt/homebrew/opt/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

lspconfig.sumneko_lua.setup {
  on_init = function(client, buff)
    U.custom_init(client)
    U.set_keymap(buff)
  end,
  on_attach = U.custom_attach,
  capabilities = U.capabilities(),
  --[[ cmd = { sumneko_binary, "-E", sumneko_root_path .. "/libexec/main.lua" }, ]]
  cmd = { sumneko_binary },

  root_dir = function(fname)
    if string.find(vim.fn.fnamemodify(fname, ":p"), ".config/nvim/") then
      return vim.fn.expand "~/.config/nvim/"
    end

    return lspconfig_util.find_git_ancestor(fname) or lspconfig_util.path.dirname(fname)
  end,

  globals = { "P", "R", "RELOAD", "require", "_G" },

  settings = {
    Lua = {
      --[[ runtime = { ]]
      --[[   version = "LuaJIT", ]]
      --[[   special = { ]]
      --[[     reload = "require", ]]
      --[[   }, ]]
      --[[ }, ]]
      diagnostics = {
        globals = { "vim", "packer_plugins", "reload" },
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
          --[[ require("neodev.sumneko").types(), ]]
          vimruntime = true, -- runtime path
          types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
          plugins = true, -- installed opt or start plugins in packpath
        },
        --[[ maxPreload = 1000, ]]
        --[[ preloadFileSize = 10000, ]]
      },
      telemetry = { enable = true },
      completion = {
        callSnippet = "Replace"
      },
    },
  },
}

local lspconfig = require "lspconfig"
local lspconfig_util = require "lspconfig.util"
local U = require "nv.plugins.lsp.utils"

local luals_root_path = "/opt/homebrew/opt/lua-language-server"
local luals_binary = luals_root_path .. "/bin/lua-language-server"

local M = {}

M.setup = function()
  lspconfig.lua_ls.setup {
    on_init = function(client, buff)
      U.custom_init(client)
      U.set_keymap(client, buff)
    end,
    on_attach = U.custom_attach,
    capabilities = U.capabilities(),
    cmd = { luals_binary },

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
          callSnippet = "Replace",
        },
      },
    },
  }
end

return M

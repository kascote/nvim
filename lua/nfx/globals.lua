local utils = require('nfx/utils')
local npm = require('nfx/npm')
local fmt = string.format
local api = vim.api

P = function(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

------------------------------------------------------------------------------
-- most of this is borrowed from https://github.com/captainko/ckovim/blob/70d09e50320de74fb3f9b9314e2e9cf70d570f86/lua/cko/globals.lua
------------------------------------------------------------------------------

--- Inspired by @tjdevries' astraunauta.nvim/ @TimUntersberger's config
--- store all callbacks in one global table so they are able to survive re-requiring this file
_G.__nfx_global_callbacks = __nfx_global_callbacks or {}

_G.nfx = {
  _store = __nfx_global_callbacks,
  --- work around to place functions in the global scope but namespaced within a table.
  --- TODO: refactor this once nvim allows passing lua functions to mappings
  mappings = {},
}

function nfx.gf()
  utils.includeexpr_js()
end

function nfx.npm_versions(findstart, base)
  return npm.lookupPackage(findstart, base)
end

-- NOTE: no need to optimize this
function nfx._create(f)
  table.insert(nfx._store, f)
  return #nfx._store
end

function nfx._execute(id, args)
  nfx._store[id](args)
end

---create a mapping function factory
---@param mode string
---@param o table
local function make_mapper(mode, o)
  -- copy the opts table as extends will mutate the opts table passed in otherwise
  local parent_opts = vim.deepcopy(o)
  ---Create a mapping

  ---@class MappingOption
  ---@field [1] string - lhs
  ---@field [2] string|function - rhs
  ---@field lhs string - lhs
  ---@field rhs string|function - rhs
  ---@field bufnr string|number?
  ---@field nowait boolean?
  ---@field silent boolean?
  ---@field expr boolean?
  ---@field unique boolean?
  ---@field script string?

  ---@function mapping function
  ---@param opts MappingOption
  return function(opts)
    local lhs = opts[1] or opts.lhs
    local rhs = opts[2] or opts.rhs
    opts[1] = nil
    opts[2] = nil
    assert(lhs ~= mode,
      fmt("The lhs should not be the same as mode for %s", lhs))
    assert(type(rhs) == "string" or type(rhs) == "function",
      "\"rhs\" should be a function or string")
    opts = opts and vim.deepcopy(opts) or {}

    local bufnr = opts.bufnr
    opts.bufnr = nil
    if type(rhs) == "function" then
      local fn_id = nfx._create(rhs)
      rhs = string.format("<cmd>lua nfx._execute(%s)<CR>", fn_id)
    end

    if bufnr and type(bufnr) == "number" then
      opts = vim.tbl_extend("keep", opts, parent_opts)
      api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    elseif not bufnr then
      api.nvim_set_keymap(mode, lhs, rhs,
        vim.tbl_extend("keep", opts, parent_opts))
    end
  end
end
local map_opts = { noremap = false, silent = true }
local noremap_opts = { noremap = true, silent = true }

nfx.nmap = make_mapper("n", map_opts)
nfx.xmap = make_mapper("x", map_opts)
nfx.imap = make_mapper("i", map_opts)
nfx.vmap = make_mapper("v", map_opts)
nfx.omap = make_mapper("o", map_opts)
nfx.tmap = make_mapper("t", map_opts)
nfx.smap = make_mapper("s", map_opts)
nfx.cmap = make_mapper("c", { noremap = false, silent = false })

nfx.nnoremap = make_mapper("n", noremap_opts)
nfx.xnoremap = make_mapper("x", noremap_opts)
nfx.vnoremap = make_mapper("v", noremap_opts)
nfx.inoremap = make_mapper("i", noremap_opts)
nfx.onoremap = make_mapper("o", noremap_opts)
nfx.tnoremap = make_mapper("t", noremap_opts)
nfx.snoremap = make_mapper("s", noremap_opts)
nfx.cnoremap = make_mapper("c", { noremap = true, silent = false })


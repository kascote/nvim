local utils = require('nfx/utils')
local npm = require('nfx/npm')

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

_G.nfx = {}

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


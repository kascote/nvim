local utils = require('nfx/utils')

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

local M = {}

function M.gf()
  utils.includeexpr_js()
end

_G.nfx = M

local utils = require "nv.utils"
local npm = require "nfx.npm"
local ls = require "luasnip"

P = function(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

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
function nfx.snip_jump_previous()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end

function nfx.snip_jump_next()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end

function nfx.snip_choice()
  if ls.choice_active() then
    -- ls.change_choice(1)
    require "luasnip.extras.select_choice"()
  end
end

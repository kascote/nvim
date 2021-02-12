
function! nfx#proxy#call_lua_func(findstart, base) abort
  return luaeval('require("npm.versions").lookupPackage(_A[1], _A[2])', [a:findstart, a:base])
endfunction

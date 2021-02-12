setlocal equalprg=python\ -mjson.tool

if expand('%:t') == 'package.json'
  setlocal completefunc=nfx#proxy#call_lua_func
endif

setlocal equalprg=python\ -mjson.tool

if expand('%:t') == 'package.json'
  setlocal completefunc=v:lua.nfx.npm_versions
endif


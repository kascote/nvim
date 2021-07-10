" setlocal omnifunc=javascriptcomplete#CompleteJS

setlocal includeexpr=v:lua.nfx.includeexpr_js(v:fname)
setlocal include=\\(\\<require\\s*(\\s*\\\|\\<import\\>\\)[^;\"']*[\"']\\zs[^\"']*
" js plugin set suffixesadd
" setlocal suffixesadd=.js,.jsx

if expand('%:t') == 'package.json'
  setlocal completefunc=v:lua.nfx.npm_versions
endif

nnoremap <buffer> <silent> gf :lua nfx.gf()<CR>



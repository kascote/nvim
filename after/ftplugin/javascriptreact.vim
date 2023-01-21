" setlocal omnifunc=javascriptcomplete#CompleteJS
" setlocal includeexpr=v:lua.nfx.includeexpr_js(v:fname)
" setlocal include=\\(\\<require\\s*(\\s*\\\|\\<import\\>\\)[^;\"']*[\"']\\zs[^\"']*
" js plugin set suffixesadd
" setlocal suffixesadd=.js,.jsx

" nnoremap <buffer> <silent> gf :lua nfx.gf()<CR>


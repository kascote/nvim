
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif
" In html buffers, completes from css, js.
let g:context_filetype#same_filetypes.html = 'css,js,javascript,jsx'

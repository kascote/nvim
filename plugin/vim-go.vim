
let s:go_loaded = v:false

function! s:load_go_plugin() abort
  if s:go_loaded
    return
  endif

  let s:go_loaded = v:true

  packadd vim-go

  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_command = "goimports"

endfunction

command! VimGoLoad call s:load_go_plugin()

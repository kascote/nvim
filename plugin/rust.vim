let s:rust_loaded = v:false

function! s:load_go_plugin() abort
  if s:rust_loaded
    return
  endif

  let s:rust_loaded = v:true

  packadd rust

  let g:rustfmt_autosave = 1

endfunction

command! VimRustLoad call s:load_rust_plugin()

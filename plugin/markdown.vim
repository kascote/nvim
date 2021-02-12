let s:md_loaded = v:false

function! s:load_md_plugin() abort
  if s:md_loaded
    return
  endif

  let s:md_loaded = v:true

  packadd vim-markdown

endfunction

command! VimMdLoad call s:load_md_plugin()

let g:nfxCursorlineBlacklist = ['command-t']

function! nfx#autocmds#should_cursorline() abort
  return index(g:nfxCursorlineBlacklist, &filetype) == -1
endfunction

function! nfx#autocmds#focus_statusline() abort
  " `setlocal statusline=` will revert to global 'statusline' setting.
  call s:update_statusline('', 'focus')
endfunction

function! nfx#autocmds#blur_statusline() abort
  " Default blurred statusline (buffer number: filename).
  " let l:blurred='%{nfx#statusline#gutterpadding()}'
  " let l:blurred ='%7*'
  let l:blurred ='%#StatusLineMOD#'
  let l:blurred.='%{nfx#statusline#lhs()}'
  let l:blurred.='%*'                                 " Reset highlight group
  let l:blurred.='\ '                                 " space
  let l:blurred.='\ '                                 " space
  let l:blurred.='\ '                                 " space
  let l:blurred.='\ '                                 " space
  let l:blurred.='%<'                                 " truncation point
  let l:blurred.='%{nfx#statusline#fileprefix()}'     " Relative path to file's directory.
  let l:blurred.='%3*'                                " Switch to User3 highlight group (bold).
  let l:blurred.='%t'                                 " Filename.
  let l:blurred.='%*'                                 " Reset highlight group
  " let l:blurred.='%f' " filename
  let l:blurred.='%=' " split left/right halves (makes background cover whole)
  call s:update_statusline(l:blurred, 'blur')
endfunction

function! s:update_statusline(default, action) abort
  let l:statusline = s:get_custom_statusline(a:action)

  if type(l:statusline) == v:t_string " type('')
    " Apply custom statusline.
    execute 'setlocal statusline=' . l:statusline
  elseif l:statusline == 0
    " Do nothing.
    "
    " Note that order matters here because of Vimscript's insane coercion rules:
    " when comparing a string to a number, the string gets coerced to 0, which
    " means that all strings `== 0`. So, we must check for string-ness first,
    " above.
    return
  else
    execute 'setlocal statusline=' . a:default
  endif
endfunction


function! s:get_custom_statusline(action) abort
  if &ft ==# 'command-t'
    " Will use Command-T-provided buffer name, but need to escape spaces.
    return '\ \ ' . substitute(bufname('%'), ' ', '\\ ', 'g')
  elseif &ft ==# 'diff' && exists('t:diffpanel') && t:diffpanel.bufname ==# bufname('%')
    return 'Undotree\ preview' " Less ugly, and nothing really useful to show.
  elseif &ft ==# 'undotree'
    return 0 " Don't override; undotree does its own thing.
  elseif &ft ==# 'nerdtree'
    return 0 " Don't override; NERDTree does its own thing.
  elseif &ft ==# 'qf'
    if a:action ==# 'blur'
      return
            \ '%{nfx#statusline#gutterpadding()}'
            \ . '\ '
            \ . '\ '
            \ . '\ '
            \ . '\ '
            \ . '%<'
            \ . '%q'
            \ . '\ '
            \ . '%{get(w:,\"quickfix_title\",\"\")}'
            \ . '%='
    else
      return
            \ '%#StatusLineLHS#'
            \ . '%{nfx#statusline#lhs()}'
            \ . '%*'
            \ . '%4*'
            \ . ''
            \ . '%*'
            \ . '\ '
            \ . '%3*'
            \ . '%q'
            \ . '\ '
            \ . '%{get(w:,\"quickfix_title\",\"\")}'
            \ . '%*'
            \ . '%<'
            \ . '\ '
            \ . '%='
            \ . '\ '
            \ . ''
            \ . '%5*'
            \ . '%{nfx#statusline#rhs()}'
            \ . '%*'
    endif
  endif

  return 1 " Use default.
endfunction

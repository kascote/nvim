
function! nfx#ale#linterstatus() abort
  if !exists('g:loaded_ale')
    return ''
  endif

  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'ok' : printf(
  \   'w:%-2d e:%-2d',
  \   all_non_errors,
  \   all_errors
  \)
endfunction

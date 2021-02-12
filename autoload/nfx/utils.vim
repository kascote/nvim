
" Cycle through relativenumber + number, number (only), and no numbering.
function! nfx#utils#cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

" Execute a command preserving the cursor position
" function! nfx#utils#preserve(command) abort
"   " Preparation: save last search, and cursor position.
"   let _s=@/
"   let l = line(".")
"   let c = col(".")
"   " Do the business:
"   execute a:command
"   " Clean up: restore previous search history, and cursor position
"   let @/=_s
"   call cursor(l, c)
" endfunction

function! nfx#utils#preserve(command) abort
  let l:save = winsaveview()
  echom bufnr()
  execute a:command
  call winrestview(l:save)
endfunction

" resolve a vim function in a file
function! nfx#utils#vim_includeexpr(value)
  let file = substitute(a:value, '\v.*\zs\#.*', '.vim', '')
  return substitute(file, '\#', '/', 'g')
endfunction

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

" function! functions#NeatFoldText()
"   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
"   let lines_count = v:foldend - v:foldstart + 1
"   let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
"   let foldchar = matchstr(&fillchars, 'fold:\zs.')
"   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"   let foldtextend = lines_count_text . repeat(foldchar, 8)
"   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
" endfunction

function! nfx#utils#NeatFoldText()
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction


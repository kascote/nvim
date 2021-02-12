scriptencoding utf-8

function! nfx#statusline#fileprefix() abort
  let l:basename=expand('%:h')
  if l:basename ==# '' || l:basename ==# '.'
    return ''
  elseif has('modify_fname')
    " Make sure we show $HOME as ~.
    return substitute(fnamemodify(l:basename, ':~:.'), '/$', '', '') . '/'
  else
    " Make sure we show $HOME as ~.
    return substitute(l:basename . '/', '\C^' . $HOME, '~', '')
  endif
endfunction

function! nfx#statusline#ft() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! nfx#statusline#fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc
  else
    return ''
  endif
endfunction

function! nfx#statusline#lhs() abort
  " let l:line=nfx#statusline#gutterpadding()
  " ★☆✪ ✠ ⚝  ✫  ✭  ❨ ❩ ●
  let l:line=&modified ? '  ● ' : '    '
  return l:line
endfunction

function! nfx#statusline#rhs() abort
  let l:rhs=' '
  if winwidth(0) > 80
    let l:column=virtcol('.')
    let l:width=virtcol('$')
    let l:line=line('.')
    let l:height=line('$')

    " Add padding to stop rhs from changing too much as we move the cursor.
    let l:padding=len(l:height) - len(l:line)
    if (l:padding)
      let l:rhs.=repeat(' ', l:padding)
    endif

    let l:rhs.='ℓ ' " (Literal, \u2113 "SCRIPT SMALL L").
    let l:rhs.=l:line
    let l:rhs.='/'
    let l:rhs.=l:height
    let l:rhs.=' 𝚌 ' " (Literal, \u1d68c "MATHEMATICAL MONOSPACE SMALL C").
    let l:rhs.=l:column
    let l:rhs.='/'
    let l:rhs.=l:width
    let l:rhs.=' '

    " Add padding to stop rhs from changing too much as we move the cursor.
    if len(l:column) < 2
      let l:rhs.=' '
    endif
    if len(l:width) < 2
      let l:rhs.=' '
    endif
  endif
  return l:rhs
endfunction

let s:default_lhs_color='StatusLineLHS' " 'GruvboxRed' 'Identifier'
let s:async_lhs_color='GruvboxGreen' "'Constant'
let s:modified_lhs_color='StatusLineLHS' " 'ModeMsg'
let s:nfx_statusline_status_highlight=s:default_lhs_color
let s:async=0

function! nfx#statusline#async_start() abort
  let s:async=1
  call nfx#statusline#check_modified()
endfunction

function! nfx#statusline#async_finish() abort
  let s:async=0
  call nfx#statusline#check_modified()
endfunction

function! nfx#statusline#check_modified() abort
  if &modified && s:nfx_statusline_status_highlight != s:modified_lhs_color
    let s:nfx_statusline_status_highlight=s:modified_lhs_color
    call nfx#statusline#update_highlight()
  elseif !&modified
    if s:async && s:nfx_statusline_status_highlight != s:async_lhs_color
      let s:nfx_statusline_status_highlight=s:async_lhs_color
      call nfx#statusline#update_highlight()
    elseif !s:async && s:nfx_statusline_status_highlight != s:default_lhs_color
      let s:nfx_statusline_status_highlight=s:default_lhs_color
      call nfx#statusline#update_highlight()
    endif
  endif
endfunction

function! nfx#statusline#update_highlight() abort
  if !nfx#pinnacle#active()
    return
  endif

  " Update StatusLine to use italics (used for filetype).
  let l:highlight=pinnacle#italicize('StatusLine')
  execute 'highlight User1 ' . l:highlight

  " Update MatchParen to use italics (used for blurred statuslines).
  let l:highlight=pinnacle#italicize('MatchParen')
  execute 'highlight User2 ' . l:highlight

  " StatusLine + bold (used for file names).
  let l:highlight=pinnacle#embolden('StatusLine')
  execute 'highlight User3 ' . l:highlight

  " Inverted StatusLineLHS styling, for left-hand side "Powerline" triangle.
  let l:bg1=pinnacle#extract_bg(s:nfx_statusline_status_highlight)
  let l:bg=pinnacle#extract_bg('StatusLineLinter')
  execute 'highlight User4 ' . pinnacle#highlight({'bg': l:bg, 'fg': l:bg1})

  " blend LHS with Linter
  let l:bg=pinnacle#extract_bg('StatusLine')
  let l:fg=pinnacle#extract_bg('StatusLineLinter')
  execute 'highlight User7 ' . pinnacle#highlight({'bg': l:bg, 'fg': l:fg})

  " Inverte Right-hand side section, for right-hand side "Powerline" triangle.
  let l:fg=pinnacle#extract_fg('StatusLineRHS')
  let l:bg=pinnacle#extract_bg('StatusLineRHS')
  execute 'highlight User6 ' .
        \ pinnacle#highlight({
        \   'bg': l:fg,
        \   'fg': l:bg,
        \   'term': 'bold,italic'
        \ })

  highlight clear StatusLineNC
  highlight! link StatusLineNC User1
endfunction

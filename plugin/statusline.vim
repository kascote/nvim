scriptencoding utf-8


if !has("statusline")
  finish
end


function! InactiveLine()
    return luaeval("require'status-line'.inactiveLine()")
endfunction

function! ActiveLine()
    return luaeval("require'status-line'.activeLine()")
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END


" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" set statusline =%#StatusLineLHS#                   " Switch to User5 highlight group.
" set statusline+=%{nfx#statusline#lhs()}
" set statusline+=%*                                 " Reset highlight group.
" set statusline+=%<                                 " Truncation point, if not enough width available.
" set statusline+=%{nfx#statusline#fileprefix()}     " Relative path to file's directory.
" set statusline+=%t                                 " Filename.
" set statusline+=%*                                 " Reset highlight group.
" set statusline+=\                                  " Space.
" set statusline+=%([%R%{nfx#statusline#ft()}%{nfx#statusline#fenc()}]%)
" set statusline+=%*                                    " Reset highlight group.
" set statusline+=\                                     " Space.
" set statusline+=%#StatusLineLinter#                " change color
" set statusline+=%{nfx#ale#linterstatus()}
" set statusline+=%*                                 " Reset highlight group.
" set statusline+=\                                  " Space.
" set statusline+=%=                                 " Split point for left and right groups.
" set statusline+=\                                  " Space.
" set statusline+=%#StatusLineRHS#                   " change color
" set statusline+=%{nfx#statusline#rhs()}
" set statusline+=%*                                 " Reset highlight group.

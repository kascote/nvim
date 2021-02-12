
" function! nfx#window#inactiveHandler() abort
"     setlocal winhighlight=Normal:InactiveWindow,EndOfBuffer:InactiveWindow,IncSearch:ColorColumn,CursorLineNr:InactiveWindow,SignColumn:InactiveWindow
" endfunction
"
" function! nfx#window#activeHandler() abort
"   if &previewwindow
"     set winhighlight=Normal:PopupWindow
"   else
"     setlocal winhighlight=
"   endif
" endfunction

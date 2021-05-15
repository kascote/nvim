finish
if (g:colors_name == 'oak')

  hi! link GitSignsAdd DiffAdd
  hi! link GitSignsChange DiffChange
  hi! link GitSignsDelete DiffDelete
  " hi! link GitSignsCurrentLineBlame NonText
  
  call oak#hi('GitSignsAddNr', '', g:oak#palette.trunk1)
  call oak#hi('GitSignsChangeNr','', g:oak#palette.trunk1)
  call oak#hi('GitSignsDeleteNr','', g:oak#palette.trunk1)
  call oak#hi('GitSignsDeleteNr','', g:oak#palette.trunk1)
  call oak#hi('GitSignsChangeNr','', g:oak#palette.trunk1)

  call oak#hi('GitSignsAddLn','', g:oak#palette.trunk1)
  call oak#hi('GitSignsChangeLn','', g:oak#palette.trunk1)
  call oak#hi('GitSignsDeleteLn','', g:oak#palette.trunk1)
  call oak#hi('GitSignsDeleteLn','', g:oak#palette.trunk1)
  call oak#hi('GitSignsChangeLn','', g:oak#palette.trunk1)

  call oak#hi('GitSignsCurrentLineBlame',     g:oak#palette.trunk4)
endif


let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='bg0'
let g:gruvbox_number_column='bg0'

let g:gruvbox_colors = {'dark0_hard': '#151515'}

set background=dark
colorscheme oak " farin gruvbox

" highlight! InactiveWindow guifg=#666666 guibg=#151515
" highlight! PopupWindow guifg=#bfbfbf guibg=#333333

if (g:colors_name =~# "gruvbox")
  highlight! CursorLine guifg=none guibg=#1d2021
  highlight! Folded guifg=none guibg=#1d2021
  highlight! StatusLine guifg=#333333

  highlight! StatusLineLHS      guifg=#FFB454 guibg=#333333
  highlight! StatusLineRHS      guifg=#1d2021 guibg=#d5c4a1
  highlight! StatusLineMOD      guifg=#fb4934 guibg=#333333
  highlight! StatusLineRO       guifg=#fb4934 guibg=#333333
  highlight! StatusLineLinter   guifg=#fb4934 guibg=#333333
  "
  highlight! StatusLineModeNormal guifg=#FFB454 guibg=#333333
  highlight! StatusLineModeVisual guifg=#333333 guibg=#fe8019
  highlight! StatusLineModeInsert guifg=#333333 guibg=#8ec07c
  highlight! StatusLineModeReplace guifg=#333333 guibg=#59C2FF
  highlight! StatusLineModeCommand guifg=#333333 guibg=#D37ACC
  highlight! StatusLineLow         guifg=#777777 guibg=#333333

  highlight! StatusLineLspInfo guifg=Cyan guibg=#333333
  highlight! StatusLineLspHint guifg=White guibg=#333333
  highlight! StatusLineLspWarn guifg=Orange guibg=#333333
  highlight! StatusLineLspError guifg=Red guibg=#333333

  highlight GitGutterAdd guifg=#8ec07c guibg=bg
  highlight GitGutterChange guifg=#fabd2f guibg=bg
  highlight GitGutterDelete guifg=#fb4934 guibg=bg
  highlight GitGutterChangeDelete guifg=#fe8019 guibg=bg

  highlight ALEWarningSign guifg=#fabd2f guibg=bg
  highlight ALEErrorSign guifg=#fb4934 guibg=bg
  highlight ALEInfoSign guifg=#83a598 guibg=bg

  highlight! TabLineFill guifg=LightGreen guibg=#333333
  highlight! TabLine cterm=none gui=none guifg=#777777 guibg=#333333
  highlight! TabLineSel cterm=none guifg=#FFB454 guibg=#333333
  highlight! TabLineMod guifg=Red guibg=#333333
  highlight! TabLineModBuf guifg=#59C2FF guibg=#333333
  highlight! TabLineModNone guifg=#555555 guibg=#333333
end

if (g:colors_name =~# "oak")
  call oak#hi('CursorLine',         '',                     g:oak#palette.trunk6)
  call oak#hi('MatchParen',         g:oak#palette.trunk1,   g:oak#palette.petal2)
  call oak#hi('StatusLine',         g:oak#palette.trunk4,   g:oak#palette.trunk2, '')
  call oak#hi('StatusLineNC',       g:oak#palette.trunk7,   g:oak#palette.trunk2)
  call oak#hi('Comment',            '#7795F9')
  call oak#hi('Cursor',             '',                     '#E2294F')
  call oak#hi('iCursor',            '',                     '#9CE37D')
  call oak#hi('Folded',             g:oak#palette.petal3,   g:oak#palette.trunk6)

  call oak#hi('StatusLineLspInfo',  g:oak#palette.leaf2,    g:oak#palette.trunk2)
  call oak#hi('StatusLineLspHint',  g:oak#palette.leaf1,    g:oak#palette.trunk2)
  call oak#hi('StatusLineLspWarn',  g:oak#palette.petal2,   g:oak#palette.trunk2)
  call oak#hi('StatusLineLspError', g:oak#palette.petal1,   g:oak#palette.trunk2)

  call oak#hi('TabLine',            g:oak#palette.trunk4,   g:oak#palette.trunk2)
  call oak#hi('TabLineFill',        g:oak#palette.trunk4,   g:oak#palette.trunk2)
  call oak#hi('TabLineSel',         g:oak#palette.trunk5,   g:oak#palette.trunk2)
  call oak#hi('TabLineMod',         g:oak#palette.petal1,   g:oak#palette.trunk2)
  call oak#hi('TabLineModBuf',      g:oak#palette.leaf2,    g:oak#palette.trunk2)
  call oak#hi('TabLineModNone',     g:oak#palette.trunk2,   g:oak#palette.trunk2)

  call oak#hi('TSPunctBracket',     g:oak#palette.trunk4)
  call oak#hi('TSConstructor',      g:oak#palette.fur4)
end

"
" " call matchadd('ColorColumn', '\%81v', 100)
" " call matchadd('ColorColumn', '\%121v', 100)



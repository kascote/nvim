
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='bg0'
let g:gruvbox_number_column='bg0'

let g:gruvbox_colors = {'dark0_hard': '#151515'}

set background=dark
colorscheme gruvbox

" colorscheme srcery " basic night nazgul
" lua pcall(function() require('colorbuddy').colorscheme('gruvbuddy') end)
" lua pcall(function() require('colorbuddy') end)

" highlight! InactiveWindow guifg=#666666 guibg=#151515
" highlight! PopupWindow guifg=#bfbfbf guibg=#333333

" hi Normal ctermfg=15 ctermbg=0 guifg=#ACA792 guibg=#0f0f0e
" hi SignColumn ctermbg=0 guibg=#0f0f0e

" highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" remove color for sign column
" highlight clear SignColumn
" highlight! SignColumn guibg=bg ctermbg=bg

" hi def link rubyKeywordAsMethod rubyConstant
" hi! link rubyInteger GruvboxYellow
" hi! rubyBoolean guifg=#D37ACC
" hi! link rubyBlockParameterList GruvboxBlue

" hi! typescriptClassName guifg=#bfbfbf

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

" " highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#FF2931
"
" highlight mkdLink guifg=#59C2FF
" highlight mkdCode guibg=#222222 guifg=#888888
" highlight mkdHeading guifg=#efefef
" highlight! link htmlH1 mkdHeading
" highlight! link htmlH2 mkdHeading
" highlight! link htmlH3 mkdHeading
" highlight! link htmlH4 mkdHeading
" highlight! link htmlH5 mkdHeading
" highlight! link htmlH6 mkdHeading
"
" highlight! link jsStorageClass PreProc
" highlight! link jsTry PreProc
" highlight! link jsCatch PreProc
" highlight! link jsFinally PreProc
" highlight! link jsException PreProc
"
" highlight typescriptBraces guifg=#515151
"
" highlight! link jsxTagName PreProc
" highlight! link jsxOpenPunct Normal
" highlight! link jsxClosePunct Normal
"
" highlight! link helpHeader Identifier
"
"
" " call matchadd('ColorColumn', '\%81v', 100)
" " call matchadd('ColorColumn', '\%121v', 100)

highlight! TabLineFill guifg=LightGreen guibg=#333333
highlight! TabLine cterm=none gui=none guifg=#777777 guibg=#333333
highlight! TabLineSel cterm=none guifg=#FFB454 guibg=#333333
highlight! TabLineMod guifg=Red guibg=#333333
highlight! TabLineModBuf guifg=#59C2FF guibg=#333333
highlight! TabLineModNone guifg=#555555 guibg=#333333

" highlight nCursor guifg=LightGreen guibg=#101010
" set guicursor=n-v-c:block-nCursor
" set guicursor+=i:block-Cursor

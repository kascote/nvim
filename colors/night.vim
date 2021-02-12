" Night - A very gray Vim theme
if exists('g:night_loaded')
  finish
endif

function! s:signify_unloaded(scheme) abort
  if a:scheme !=# 'night' && exists('g:night_loaded')
    unlet g:night_loaded
  endif
endfunction

augroup night_aucmds
  au!
  au ColorScheme * call s:signify_unloaded(expand('<amatch>'))
augroup END

highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'night'
let s:palette = {}
let s:palette.blackest  = '#0f0f0f'
let s:palette.black     = '#282828'
let s:palette.gray01    = '#333333'
let s:palette.gray02    = '#515151'
let s:palette.gray03    = '#5b5b5b'
let s:palette.gray04    = '#666666'
let s:palette.gray05    = '#727272'
let s:palette.gray06    = '#828282'
let s:palette.gray07    = '#8c8c8c'
let s:palette.gray08    = '#969696'
let s:palette.gray09    = '#a0a0a0'
let s:palette.gray10    = '#aaaaaa'
let s:palette.gray11    = '#b5b5b5'
let s:palette.gray12    = '#bfbfbf'
let s:palette.gray13    = '#c9c9c9'
let s:palette.gray14    = '#d3d3d3'
let s:palette.gray15    = '#efefef'
let s:palette.white     = '#f9f9f9'
let s:palette.comments  = copy(s:palette.gray10)
let s:palette.purple    = '#5f5fd7'
let s:palette.brown     = '#875f00'
let s:palette.blue      = '#005f87'
let s:palette.lightblue = '#00afff'
let s:palette.green     = '#00875f'
let s:palette.red       = '#870000'
let s:palette.magenta   = '#7f007f'


let s:palette.red       = '#fb4934'
let s:palette.orange    = '#fe8019'
let s:palette.yellow    = '#fabd2f' " '#96711c'
let s:palette.green     = '#b8bb26'
let s:palette.cyan      = '#8ec07c'
let s:palette.blue      = '#83a598'
let s:palette.purple    = '#6a4d75'
let s:palette.brown     = '#d65d0e'


let g:terminal_color_0 = s:palette.gray01
let g:terminal_color_1 = s:palette.gray06
let g:terminal_color_2 = s:palette.gray03
let g:terminal_color_3 = s:palette.gray11
let g:terminal_color_4 = s:palette.gray02
let g:terminal_color_5 = s:palette.gray08
let g:terminal_color_6 = s:palette.gray09
let g:terminal_color_7 = s:palette.gray13
let g:terminal_color_8 = s:palette.gray03
let g:terminal_color_9 = s:palette.gray10
let g:terminal_color_10 = s:palette.gray07
let g:terminal_color_11 = s:palette.gray15
let g:terminal_color_12 = s:palette.gray05
let g:terminal_color_13 = s:palette.gray12
let g:terminal_color_14 = s:palette.gray14
let g:terminal_color_15 = s:palette.white

hi Normal guifg=#c9c9c9 guibg=#111111
hi Constant guifg=#727272 gui=bold
hi String guifg=#aaaaaa
hi Number guifg=#828282

hi NormalFloat guifg=#c9c9c9 guibg=#333333

hi Identifier guifg=#969696 gui=none
hi Function guifg=#969696

hi Statement guifg=#727272 gui=bold
hi Operator guifg=#c9c9c9 gui=none
hi Keyword guifg=#c9c9c9

hi PreProc guifg=#8c8c8c gui=none

hi Type guifg=#c9c9c9 gui=bold

hi Special guifg=#727272
hi SpecialComment guifg=#aaaaaa gui=bold

hi Title guifg=#8c8c8c gui=bold
hi Todo guifg=#5f5fd7 guibg=#282828
hi Comment guifg=#6a4d75 gui=italic

hi LineNr guifg=#666666 guibg=#141414 gui=none
hi FoldColumn guifg=#8c8c8c guibg=#141414 gui=none
hi CursorLine guibg=#282828 gui=none
hi CursorLineNr guifg=#d3d3d3 guibg=#282828 gui=none

hi Visual guifg=#282828 guibg=#828282
hi Search guifg=#333333 guibg=#b5b5b5 gui=none
hi IncSearch guifg=#282828 guibg=#8c8c8c gui=bold

hi SpellBad guifg=#870000 gui=undercurl
hi SpellCap guifg=#870000 gui=undercurl
hi SpellLocal guifg=#870000 gui=undercurl
hi SpellRare guifg=#875f00 gui=undercurl

hi Error guifg=#870000 gui=bold
hi ErrorMsg guifg=#870000
hi WarningMsg guifg=#875f00
hi ModeMsg guifg=#aaaaaa
hi MoreMsg guifg=#aaaaaa

hi MatchParen guifg=#87005f

hi Cursor guibg=#bfbfbf
hi Underlined guifg=#969696 gui=underline
hi SpecialKey guifg=#666666
hi NonText guifg=#515151
hi Directory guifg=#969696

hi Pmenu guifg=#aaaaaa guibg=#5b5b5b gui=none
hi PmenuSbar guifg=#282828 guibg=#efefef gui=none
hi PmenuSel guifg=#5b5b5b guibg=#aaaaaa
hi PmenuThumb guifg=#5b5b5b guibg=#a0a0a0 gui=none

hi StatusLine guifg=#b5b5b5 guibg=#5b5b5b gui=none
hi StatusLineNC guifg=#666666 guibg=#333333 gui=none
hi WildMenu guifg=#969696
hi VertSplit guifg=#5b5b5b guibg=#5b5b5b gui=none

hi DiffAdd guifg=#141414 guibg=#00875f
hi DiffChange guifg=#141414 guibg=#005f87
hi DiffDelete guifg=#141414 guibg=#870000
hi DiffText guifg=#282828 guibg=#00afff
hi DiffAdded guifg=#00875f
hi DiffChanged guifg=#005f87
hi DiffRemoved guifg=#870000

hi! link Character Constant
hi! link Float Number
hi! link Boolean Number

hi! link SignColumn FoldColumn
hi! link ColorColumn FoldColumn
hi! link CursorColumn CursorLine

hi! link Folded LineNr
hi! link Conceal Normal
hi! link ErrorMsg Error

hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement

hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

hi! link SpecialChar Special
hi! link Tag Special
hi! link Delimiter Special
hi! link Debug Special
hi! link Question Special

hi! link VisualNOS Visual
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine

hi ALEError guifg=#ff727b ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl guisp=#9d0006
hi ALEWarning guifg=#fabd2f ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl guisp=#b57614
hi ALEInfo guifg=#83a598 ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl

hi RedSign guifg=#cc241d ctermfg=124 guibg=#282828 gui=NONE cterm=NONE
hi YellowSign guifg=#fabd2f ctermfg=214 guibg=#282828 gui=NONE cterm=NONE
hi GreenSign guifg=#b8cc26 ctermfg=142 guibg=#282828 gui=NONE cterm=NONE
hi BlueSign guifg=#83a5cb ctermfg=109 guibg=#282828 gui=NONE cterm=NONE
hi AquaSign guifg=#8ec07c ctermfg=108 guibg=#282828 gui=NONE cterm=NONE

hi RedHover guifg=#cc241d ctermfg=124 gui=NONE cterm=NONE
hi YellowHover guifg=#fabd2f ctermfg=214 gui=NONE cterm=NONE
hi OrangeHover guifg=#fd7d2f ctermfg=214 gui=NONE cterm=NONE
hi GreenHover guifg=#b8cc26 ctermfg=142 gui=NONE cterm=NONE
hi BlueHover guifg=#83a5cb ctermfg=109 gui=NONE cterm=NONE
hi AquaHover guifg=#8ec07c ctermfg=108 gui=NONE cterm=NONE
hi WhiteHover guifg=#ffffff ctermfg=108 gui=NONE cterm=NONE

hi Todo guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=bold cterm=bold

hi ShadyAqua guibg=#8ec07c ctermbg=108
hi ShadyGray guifg=#928374 ctermfg=245 guibg=NONE ctermbg=NONE
hi ShadyYellow guifg=#fabd2f ctermfg=214 guibg=NONE ctermbg=NONE
hi ShadyOrange guifg=#fe8019 ctermfg=208 guibg=NONE ctermbg=NONE

hi! link ALEErrorSign RedSign
hi! link ALEWarningSign YellowSign
hi! link ALEStyleErrorSign RedSign
hi! link ALEStyleWarningSign YellowSign
hi! link ALEInfoSign BlueSign

hi! link SignifySignAdd GreenSign
hi! link SignifySignChange AquaSign
hi! link SignifySignDelete RedSign

hi! link MatchParen ShadyOrange

hi! link DiffAdded GreenSign
hi! link DiffChanged BlueSign
hi! link DiffRemoved RedSign

hi! link SpellBad RedSign
hi! link Error RedSign
hi! link ErrorMsg RedSign

hi! link EndOfBuffer NonText

let g:night_loaded = v:true











"    highlights = [
"        [ "Normal", black, white, "NONE" ],
"        [ "NonText", black, gray, "NONE" ],
"        [ "EndOfBuffer","NonText" ],
"        [ "Comment", black, gray, "NONE" ],
"        [ "Constant", black, white, "NONE" ],
"        [ "Error", black, white, "NONE" ],
"        [ "Identifier", black, white, "NONE" ],
"        [ "Ignore", black, white, "NONE" ],
"        [ "PreProc", black, white, "NONE" ],
"        [ "Special", black, white, "NONE" ],
"        [ "Statement", black, white, "NONE" ],
"        [ "String", black, green, "NONE" ],
"        [ "Number", "Constant" ],
"        [ "Todo", black, white, "NONE" ],
"        [ "Type", black, white, "NONE" ],
"        [ "Underlined", black, white, "NONE" ],
"        [ "StatusLine", black, white, "NONE" ],
"        [ "StatusLineNC", black, white, "NONE" ],
"        [ "StatusLineTerm", "StatusLine" ],
"        [ "StatusLineTermNC", "StatusLineNC" ],
"        [ "VertSplit", black, white, "NONE" ],
"        [ "TabLine", black, white, "NONE" ],
"        [ "TabLineFill", black, white, "NONE" ],
"        [ "TabLineSel", black, white, "NONE" ],
"        [ "Title", black, white, "NONE" ],
"        [ "CursorLine", darkgray, "NONE", "NONE" ],
"        [ "LineNr", black, gray, "NONE" ],
"        [ "CursorLineNr", black, yellow, "NONE" ],
"        [ "helpLeadBlank", black, white, "NONE" ],
"        [ "helpNormal", black, white, "NONE" ],
"        [ "Visual", black, white, "NONE" ],
"        [ "VisualNOS", black, white, "NONE" ],
"        [ "Pmenu", black, white, "NONE" ],
"        [ "PmenuSbar", black, white, "NONE" ],
"        [ "PmenuSel", black, white, "NONE" ],
"        [ "PmenuThumb", black, white, "NONE" ],
"        [ "FoldColumn", black, red, "NONE" ],
"        [ "Folded", black, gray, "NONE" ],
"        [ "WildMenu", black, white, "NONE" ],
"        [ "SpecialKey", black, blue, "NONE" ],
"        [ "DiffAdd", black, white, "NONE" ],
"        [ "DiffChange", black, white, "NONE" ],
"        [ "DiffDelete", black, white, "NONE" ],
"        [ "DiffText", black, white, "NONE" ],
"        [ "IncSearch", black, white, "NONE" ],
"        [ "Search", black, white, "NONE" ],
"        [ "Directory", black, white, "NONE" ],
"        [ "MatchParen", red, white, "NONE" ],
"        [ "SpellBad", black, white, "NONE", red ],
"        [ "SpellCap", black, white, "NONE", blue ],
"        [ "SpellLocal", black, white, "NONE", magenta ],
"        [ "SpellRare", black, white, "NONE", cyan ],
"        [ "ColorColumn", black, white, "NONE" ],
"        [ "SignColumn", black, white, "NONE" ],
"        [ "ErrorMsg", black, white, "NONE" ],
"        [ "ModeMsg", black, white, "NONE" ],
"        [ "MoreMsg", black, white, "NONE" ],
"        [ "Question", black, white, "NONE" ],
"        [ "WarningMsg", "Error" ],
"        [ "Cursor", black, red, "NONE" ],
"        [ "CursorIM", "Cursor" ],
"        [ "CursorColumn", darkgray, "NONE", "NONE" ],
"        [ "QuickFixLine", black, white, "NONE" ],
"        [ "Terminal", "Normal" ],
"        [ "Conceal", black, white, "NONE" ],
"        [ "ToolbarLine", black, white, "NONE" ],
"        [ "ToolbarButton", black, white, "NONE" ],
"        [ "debugPC", black, white, "NONE" ],
"        [ "debugBreakpoint", black, white, "NONE" ],
"        [ "Whitespace", black, blue, "NONE"],
"    ]

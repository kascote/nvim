" basic.vim -- Vim color scheme.
" Author:      nelson fernandez (g33k@netflux.com.ar)
" Webpage:     http://g33k.netflux.com.ar
" Description: Lorem ipsum dolor sit amet.
" Last Change: 2020-06-12

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "basic"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=0 ctermfg=23 cterm=NONE guibg=#101010 guifg=#8c8c8c gui=NONE
    hi NormalFloat ctermbg=34 ctermfg=23 cterm=NONE guibg=#181818 guifg=#8c8c8c gui=NONE
    hi NonText ctermbg=0 ctermfg=17 cterm=NONE guibg=#101010 guifg=#333333 gui=NONE
    hi Ignore ctermbg=0 ctermfg=9 cterm=NONE guibg=#101010 guifg=#FF3333 gui=NONE
    hi Todo ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi Underlined ctermbg=0 ctermfg=22 cterm=NONE guibg=#101010 guifg=#828282 gui=NONE
    hi VertSplit ctermbg=0 ctermfg=16 cterm=NONE guibg=#101010 guifg=#282828 gui=NONE
    hi Title ctermbg=0 ctermfg=20 cterm=NONE guibg=#101010 guifg=#666666 gui=NONE
    hi LineNr ctermbg=0 ctermfg=16 cterm=NONE guibg=#101010 guifg=#282828 gui=NONE
    hi WildMenu ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi SpecialKey ctermbg=0 ctermfg=12 cterm=NONE guibg=#101010 guifg=#69BAFF gui=NONE
    hi Directory ctermbg=0 ctermfg=19 cterm=NONE guibg=#101010 guifg=#5b5b5b gui=NONE
    hi MatchParen ctermbg=0 ctermfg=1 cterm=NONE guibg=#101010 guifg=#D96C75 gui=NONE
    hi Whitespace ctermbg=0 ctermfg=12 cterm=NONE guibg=#101010 guifg=#69BAFF gui=NONE
    hi Substitute ctermbg=0 ctermfg=12 cterm=NONE guibg=#101010 guifg=#69BAFF gui=NONE
    hi MsgArea ctermbg=0 ctermfg=27 cterm=NONE guibg=#101010 guifg=#b5b5b5 gui=NONE
    hi MsgSeparator ctermbg=17 ctermfg=12 cterm=NONE guibg=#333333 guifg=#69BAFF gui=NONE
    hi Boolean ctermbg=0 ctermfg=13 cterm=NONE guibg=#101010 guifg=#D37ACC gui=NONE
    hi Character ctermbg=0 ctermfg=2 cterm=NONE guibg=#101010 guifg=#91B362 gui=NONE
    hi Comment ctermbg=0 ctermfg=5 cterm=italic guibg=#101010 guifg=#9F5B99 gui=italic
    hi Conditional ctermbg=0 ctermfg=18 cterm=NONE guibg=#101010 guifg=#515151 gui=NONE
    hi Constant ctermbg=0 ctermfg=28 cterm=NONE guibg=#101010 guifg=#bfbfbf gui=NONE
    hi Debug ctermbg=0 ctermfg=4 cterm=NONE guibg=#101010 guifg=#6994BF gui=NONE
    hi debugPC ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi debugBreakpoint ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi Define ctermbg=0 ctermfg=6 cterm=NONE guibg=#101010 guifg=#55B4D4 gui=NONE
    hi Delimiter ctermbg=0 ctermfg=18 cterm=NONE guibg=#101010 guifg=#515151 gui=NONE
    hi Exception ctermbg=0 ctermfg=9 cterm=NONE guibg=#101010 guifg=#FF3333 gui=NONE
    hi Float ctermbg=0 ctermfg=3 cterm=NONE guibg=#101010 guifg=#E6B450 gui=NONE
    hi Function ctermbg=0 ctermfg=30 cterm=NONE guibg=#101010 guifg=#d3d3d3 gui=NONE
    hi Identifier ctermbg=0 ctermfg=30 cterm=NONE guibg=#101010 guifg=#d3d3d3 gui=NONE
    hi Include ctermbg=0 ctermfg=18 cterm=NONE guibg=#101010 guifg=#515151 gui=NONE
    hi Keyword ctermbg=0 ctermfg=25 cterm=NONE guibg=#101010 guifg=#a0a0a0 gui=NONE
    hi Macro ctermbg=0 ctermfg=5 cterm=NONE guibg=#101010 guifg=#9F5B99 gui=NONE
    hi Number ctermbg=0 ctermfg=3 cterm=NONE guibg=#101010 guifg=#E6B450 gui=NONE
    hi Operator ctermbg=0 ctermfg=28 cterm=NONE guibg=#101010 guifg=#bfbfbf gui=NONE
    hi PreCondit ctermbg=0 ctermfg=11 cterm=NONE guibg=#101010 guifg=#FFB454 gui=NONE
    hi PreProc ctermbg=0 ctermfg=18 cterm=NONE guibg=#101010 guifg=#515151 gui=NONE
    hi Special ctermbg=0 ctermfg=18 cterm=NONE guibg=#101010 guifg=#515151 gui=NONE
    hi SpecialChar ctermbg=0 ctermfg=9 cterm=NONE guibg=#101010 guifg=#FF3333 gui=NONE
    hi SpecialComment ctermbg=0 ctermfg=13 cterm=NONE guibg=#101010 guifg=#D37ACC gui=NONE
    hi Statement ctermbg=0 ctermfg=22 cterm=NONE guibg=#101010 guifg=#828282 gui=NONE
    hi StorageClass ctermbg=0 ctermfg=14 cterm=NONE guibg=#101010 guifg=#59C2FF gui=NONE
    hi String ctermbg=0 ctermfg=2 cterm=NONE guibg=#101010 guifg=#91B362 gui=NONE
    hi Structure ctermbg=0 ctermfg=18 cterm=NONE guibg=#101010 guifg=#515151 gui=NONE
    hi Tag ctermbg=0 ctermfg=11 cterm=NONE guibg=#101010 guifg=#FFB454 gui=NONE
    hi Type ctermbg=0 ctermfg=25 cterm=NONE guibg=#101010 guifg=#a0a0a0 gui=NONE
    hi Typedef ctermbg=0 ctermfg=3 cterm=NONE guibg=#101010 guifg=#E6B450 gui=NONE
    hi Error ctermbg=0 ctermfg=1 cterm=NONE guibg=#101010 guifg=#D96C75 gui=NONE
    hi ErrorMsg ctermbg=0 ctermfg=13 cterm=NONE guibg=#101010 guifg=#D37ACC gui=NONE
    hi StatusLine ctermbg=17 ctermfg=11 cterm=NONE guibg=#333333 guifg=#FFB454 gui=NONE
    hi StatusLineNC ctermbg=34 ctermfg=19 cterm=NONE guibg=#181818 guifg=#5b5b5b gui=NONE
    hi TabLine ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi TabLineFill ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi TabLineSel ctermbg=0 ctermfg=12 cterm=NONE guibg=#101010 guifg=#69BAFF gui=NONE
    hi CursorLine ctermbg=34 ctermfg=NONE cterm=NONE guibg=#181818 guifg=NONE gui=NONE
    hi CursorLineNr ctermbg=0 ctermfg=21 cterm=NONE guibg=#101010 guifg=#727272 gui=NONE
    hi ColorColumn ctermbg=16 ctermfg=NONE cterm=NONE guibg=#282828 guifg=NONE gui=NONE
    hi CursorColumn ctermbg=8 ctermfg=NONE cterm=NONE guibg=#151A1E guifg=NONE gui=NONE
    hi helpLeadBlank ctermbg=0 ctermfg=28 cterm=NONE guibg=#101010 guifg=#bfbfbf gui=NONE
    hi helpNormal ctermbg=0 ctermfg=18 cterm=NONE guibg=#101010 guifg=#515151 gui=NONE
    hi Visual ctermbg=17 ctermfg=NONE cterm=NONE guibg=#333333 guifg=NONE gui=NONE
    hi VisualNOS ctermbg=17 ctermfg=NONE cterm=NONE guibg=#333333 guifg=NONE gui=NONE
    hi Pmenu ctermbg=18 ctermfg=32 cterm=NONE guibg=#515151 guifg=#f9f9f9 gui=NONE
    hi PmenuSbar ctermbg=18 ctermfg=17 cterm=NONE guibg=#515151 guifg=#333333 gui=NONE
    hi PmenuSel ctermbg=27 ctermfg=0 cterm=NONE guibg=#b5b5b5 guifg=#101010 gui=NONE
    hi PmenuThumb ctermbg=16 ctermfg=32 cterm=NONE guibg=#282828 guifg=#f9f9f9 gui=NONE
    hi Folded ctermbg=0 ctermfg=5 cterm=NONE guibg=#101010 guifg=#9F5B99 gui=NONE
    hi FoldColumn ctermbg=0 ctermfg=5 cterm=NONE guibg=#101010 guifg=#9F5B99 gui=NONE
    hi DiffAdd ctermbg=0 ctermfg=2 cterm=NONE guibg=#101010 guifg=#91B362 gui=NONE
    hi DiffChange ctermbg=0 ctermfg=3 cterm=NONE guibg=#101010 guifg=#E6B450 gui=NONE
    hi DiffDelete ctermbg=0 ctermfg=1 cterm=NONE guibg=#101010 guifg=#D96C75 gui=NONE
    hi DiffText ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi IncSearch ctermbg=3 ctermfg=0 cterm=NONE guibg=#E6B450 guifg=#101010 gui=NONE
    hi Search ctermbg=25 ctermfg=0 cterm=NONE guibg=#a0a0a0 guifg=#101010 gui=NONE
    hi SpellBad ctermbg=0 ctermfg=1 cterm=NONE guibg=#101010 guifg=#D96C75 gui=NONE guisp=#FF3333
    hi SpellCap ctermbg=0 ctermfg=2 cterm=NONE guibg=#101010 guifg=#91B362 gui=NONE guisp=#69BAFF
    hi SpellLocal ctermbg=0 ctermfg=10 cterm=NONE guibg=#101010 guifg=#C2D94C gui=NONE guisp=#D37ACC
    hi SpellRare ctermbg=0 ctermfg=5 cterm=NONE guibg=#101010 guifg=#9F5B99 gui=NONE guisp=#59C2FF
    hi SignColumn ctermbg=0 ctermfg=17 cterm=NONE guibg=#101010 guifg=#333333 gui=NONE
    hi ErrorMsg ctermbg=0 ctermfg=1 cterm=NONE guibg=#101010 guifg=#D96C75 gui=NONE
    hi ModeMsg ctermbg=0 ctermfg=9 cterm=NONE guibg=#101010 guifg=#FF3333 gui=NONE
    hi MoreMsg ctermbg=0 ctermfg=26 cterm=NONE guibg=#101010 guifg=#aaaaaa gui=NONE
    hi Question ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi Cursor ctermbg=0 ctermfg=9 cterm=NONE guibg=#101010 guifg=#FF3333 gui=NONE
    hi QuickFixLine ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi Conceal ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi ToolbarLine ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE
    hi ToolbarButton ctermbg=0 ctermfg=32 cterm=NONE guibg=#101010 guifg=#f9f9f9 gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=black ctermfg=gray07 cterm=NONE
    hi NormalFloat ctermbg=black01 ctermfg=gray07 cterm=NONE
    hi NonText ctermbg=black ctermfg=gray01 cterm=NONE
    hi Ignore ctermbg=black ctermfg=red cterm=NONE
    hi Todo ctermbg=black ctermfg=white cterm=NONE
    hi Underlined ctermbg=black ctermfg=gray06 cterm=NONE
    hi VertSplit ctermbg=black ctermfg=gray00 cterm=NONE
    hi Title ctermbg=black ctermfg=gray04 cterm=NONE
    hi LineNr ctermbg=black ctermfg=gray00 cterm=NONE
    hi WildMenu ctermbg=black ctermfg=white cterm=NONE
    hi SpecialKey ctermbg=black ctermfg=blue cterm=NONE
    hi Directory ctermbg=black ctermfg=gray03 cterm=NONE
    hi MatchParen ctermbg=black ctermfg=darkred cterm=NONE
    hi Whitespace ctermbg=black ctermfg=blue cterm=NONE
    hi Substitute ctermbg=black ctermfg=blue cterm=NONE
    hi MsgArea ctermbg=black ctermfg=gray11 cterm=NONE
    hi MsgSeparator ctermbg=gray01 ctermfg=blue cterm=NONE
    hi Boolean ctermbg=black ctermfg=magenta cterm=NONE
    hi Character ctermbg=black ctermfg=darkgreen cterm=NONE
    hi Comment ctermbg=black ctermfg=darkmagenta cterm=italic
    hi Conditional ctermbg=black ctermfg=gray02 cterm=NONE
    hi Constant ctermbg=black ctermfg=gray12 cterm=NONE
    hi Debug ctermbg=black ctermfg=darkblue cterm=NONE
    hi debugPC ctermbg=black ctermfg=white cterm=NONE
    hi debugBreakpoint ctermbg=black ctermfg=white cterm=NONE
    hi Define ctermbg=black ctermfg=darkcyan cterm=NONE
    hi Delimiter ctermbg=black ctermfg=gray02 cterm=NONE
    hi Exception ctermbg=black ctermfg=red cterm=NONE
    hi Float ctermbg=black ctermfg=darkyellow cterm=NONE
    hi Function ctermbg=black ctermfg=gray14 cterm=NONE
    hi Identifier ctermbg=black ctermfg=gray14 cterm=NONE
    hi Include ctermbg=black ctermfg=gray02 cterm=NONE
    hi Keyword ctermbg=black ctermfg=gray09 cterm=NONE
    hi Macro ctermbg=black ctermfg=darkmagenta cterm=NONE
    hi Number ctermbg=black ctermfg=darkyellow cterm=NONE
    hi Operator ctermbg=black ctermfg=gray12 cterm=NONE
    hi PreCondit ctermbg=black ctermfg=yellow cterm=NONE
    hi PreProc ctermbg=black ctermfg=gray02 cterm=NONE
    hi Special ctermbg=black ctermfg=gray02 cterm=NONE
    hi SpecialChar ctermbg=black ctermfg=red cterm=NONE
    hi SpecialComment ctermbg=black ctermfg=magenta cterm=NONE
    hi Statement ctermbg=black ctermfg=gray06 cterm=NONE
    hi StorageClass ctermbg=black ctermfg=cyan cterm=NONE
    hi String ctermbg=black ctermfg=darkgreen cterm=NONE
    hi Structure ctermbg=black ctermfg=gray02 cterm=NONE
    hi Tag ctermbg=black ctermfg=yellow cterm=NONE
    hi Type ctermbg=black ctermfg=gray09 cterm=NONE
    hi Typedef ctermbg=black ctermfg=darkyellow cterm=NONE
    hi Error ctermbg=black ctermfg=darkred cterm=NONE
    hi ErrorMsg ctermbg=black ctermfg=magenta cterm=NONE
    hi StatusLine ctermbg=gray01 ctermfg=yellow cterm=NONE
    hi StatusLineNC ctermbg=black01 ctermfg=gray03 cterm=NONE
    hi TabLine ctermbg=black ctermfg=white cterm=NONE
    hi TabLineFill ctermbg=black ctermfg=white cterm=NONE
    hi TabLineSel ctermbg=black ctermfg=blue cterm=NONE
    hi CursorLine ctermbg=black01 ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=black ctermfg=gray05 cterm=NONE
    hi ColorColumn ctermbg=gray00 ctermfg=NONE cterm=NONE
    hi CursorColumn ctermbg=darkgray ctermfg=NONE cterm=NONE
    hi helpLeadBlank ctermbg=black ctermfg=gray12 cterm=NONE
    hi helpNormal ctermbg=black ctermfg=gray02 cterm=NONE
    hi Visual ctermbg=gray01 ctermfg=NONE cterm=NONE
    hi VisualNOS ctermbg=gray01 ctermfg=NONE cterm=NONE
    hi Pmenu ctermbg=gray02 ctermfg=white cterm=NONE
    hi PmenuSbar ctermbg=gray02 ctermfg=gray01 cterm=NONE
    hi PmenuSel ctermbg=gray11 ctermfg=black cterm=NONE
    hi PmenuThumb ctermbg=gray00 ctermfg=white cterm=NONE
    hi Folded ctermbg=black ctermfg=darkmagenta cterm=NONE
    hi FoldColumn ctermbg=black ctermfg=darkmagenta cterm=NONE
    hi DiffAdd ctermbg=black ctermfg=darkgreen cterm=NONE
    hi DiffChange ctermbg=black ctermfg=darkyellow cterm=NONE
    hi DiffDelete ctermbg=black ctermfg=darkred cterm=NONE
    hi DiffText ctermbg=black ctermfg=white cterm=NONE
    hi IncSearch ctermbg=darkyellow ctermfg=black cterm=NONE
    hi Search ctermbg=gray09 ctermfg=black cterm=NONE
    hi SpellBad ctermbg=black ctermfg=darkred cterm=NONE
    hi SpellCap ctermbg=black ctermfg=darkgreen cterm=NONE
    hi SpellLocal ctermbg=black ctermfg=green cterm=NONE
    hi SpellRare ctermbg=black ctermfg=darkmagenta cterm=NONE
    hi SignColumn ctermbg=black ctermfg=gray01 cterm=NONE
    hi ErrorMsg ctermbg=black ctermfg=darkred cterm=NONE
    hi ModeMsg ctermbg=black ctermfg=red cterm=NONE
    hi MoreMsg ctermbg=black ctermfg=gray10 cterm=NONE
    hi Question ctermbg=black ctermfg=white cterm=NONE
    hi Cursor ctermbg=black ctermfg=red cterm=NONE
    hi QuickFixLine ctermbg=black ctermfg=white cterm=NONE
    hi Conceal ctermbg=black ctermfg=white cterm=NONE
    hi ToolbarLine ctermbg=black ctermfg=white cterm=NONE
    hi ToolbarButton ctermbg=black ctermfg=white cterm=NONE
endif

hi link NormalNC Normal
hi link EndOfBuffer NonText
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link WarningMsg Error
hi link TermCursor Cursor
hi link TermCursorNC Cursor
hi link CursorIM Cursor
hi link Terminal Normal

let g:terminal_ansi_colors = [
        \ '#101010',
        \ '#D96C75',
        \ '#91B362',
        \ '#E6B450',
        \ '#6994BF',
        \ '#9F5B99',
        \ '#55B4D4',
        \ '#5C6773',
        \ '#151A1E',
        \ '#FF3333',
        \ '#C2D94C',
        \ '#FFB454',
        \ '#69BAFF',
        \ '#D37ACC',
        \ '#59C2FF',
        \ '#b3b1ad',
        \ ]

" Generated with RNB (https://github.com/romainl/vim-rnb)

let g:oak#palette = {}
let g:oak#palette.trunk1  = '#0E0701'
let g:oak#palette.trunk2  = '#342212'
let g:oak#palette.trunk3  = '#593C22'
let g:oak#palette.trunk4  = '#AC9682'  " #A78A7F
let g:oak#palette.trunk5  = '#FEEFE1'  " #E7D7C1 #F5F0F6
let g:oak#palette.trunk6  = '#271A0E'  " #1A1109
let g:oak#palette.trunk7  = '#946338'
let g:oak#palette.fur1    = '#7A5454'  " #92817A
let g:oak#palette.fur2    = '#A58A86'  " #F1DABF
let g:oak#palette.fur3    = '#E27950'  " #DD7230 #FFC49B #EB9486 #C05746 #FF7F11
let g:oak#palette.fur4    = '#D69060'
let g:oak#palette.leaf1   = '#B990D5'  " #D5B0AC #E086D3 #7E7F9A #A67F8E #816E94
let g:oak#palette.leaf2   = '#2DC7D2'  " #446DF6 #08A4BD #00635D #58A4B0 #00798C #01BAEF
let g:oak#palette.leaf3   = '#42BD7D'  " #47A025 #D5E68D #7CA982 #9CE37D #337357 #59A96A
let g:oak#palette.leaf4   = '#FAA4BD'
let g:oak#palette.petal1  = '#FF4D4D'  " #BF4342 #DB324D #D1495B #FF2C55 #E2294F
let g:oak#palette.petal2  = '#F0C54C'  " #F4C95D #E7E393 #E9EB9E #EDAE49 #F2AF29 #D6BA73
let g:oak#palette.petal3  = '#F564A9'  " #FAA4BD #CB48B7

call oak#hi('CursorLine',         '',                     g:oak#palette.trunk6)
call oak#hi('MatchParen',         g:oak#palette.trunk1,   g:oak#palette.petal2)
call oak#hi('StatusLine',         g:oak#palette.trunk4,   g:oak#palette.trunk2, '')
call oak#hi('StatusLineNC',       g:oak#palette.trunk7,   g:oak#palette.trunk2)
call oak#hi('Comment',            '#7795F9')
call oak#hi('Cursor',             '',                     '#E2294F')
call oak#hi('iCursor',            '',                     '#9CE37D')
call oak#hi('Folded',             g:oak#palette.petal3,   g:oak#palette.trunk6)
call oak#hi('Todo',               g:oak#palette.trunk5)
call oak#hi('VertSplit',          g:oak#palette.trunk3)

call oak#hi('StatusLineLspInfo',  g:oak#palette.leaf2,    g:oak#palette.trunk2)
call oak#hi('StatusLineLspHint',  g:oak#palette.leaf1,    g:oak#palette.trunk2)
call oak#hi('StatusLineLspWarn',  g:oak#palette.petal2,   g:oak#palette.trunk2)
call oak#hi('StatusLineLspError', g:oak#palette.petal1,   g:oak#palette.trunk2)
call oak#hi('StatusLineLow',      g:oak#palette.trunk7,   g:oak#palette.trunk2)

call oak#hi('TabLine',            g:oak#palette.trunk4,   g:oak#palette.trunk2)
call oak#hi('TabLineFill',        g:oak#palette.trunk4,   g:oak#palette.trunk2)
call oak#hi('TabLineSel',         g:oak#palette.trunk5,   g:oak#palette.trunk2)
call oak#hi('TabLineMod',         g:oak#palette.petal1,   g:oak#palette.trunk2)
call oak#hi('TabLineModBuf',      g:oak#palette.leaf2,    g:oak#palette.trunk2)
call oak#hi('TabLineModNone',     g:oak#palette.trunk2,   g:oak#palette.trunk2)

call oak#hi('TSPunctBracket',     g:oak#palette.trunk4)
call oak#hi('TSConstructor',      g:oak#palette.fur4)
 

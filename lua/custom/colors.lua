local Color, c, Group, g, s = require("colorbuddy").setup()

-- https://github.com/Th3Whit3Wolf/onebuddy/blob/main/lua/onebuddy.lua
-- https://github.com/sainnhe/sonokai/blob/master/colors/sonokai.vim

Color.new('background',     '#0f0f0e')
Color.new('foreground',     '#ACA792')

-- Color.new('gray0',          '#282c34')
-- Color.new('gray1',          '#282a2e')
-- Color.new('gray2',          '#373b41')
-- Color.new('gray3',          '#969896')
-- Color.new('gray4',          '#b4b7b4')
-- Color.new('gray5',          '#c5c8c6')
-- Color.new('gray6',          '#e0e0e0')
-- Color.new('gray7',          '#ffffff')

Color.new('black',          '#111111')
Color.new('white',          '#f2e5bc')
Color.new('white2',         '#EEEEEE')
Color.new('red',            '#cc6666')
Color.new('green',          '#99cc99')
Color.new('yellow',         '#f8fe7a')
Color.new('yellow1',        '#d8e271')
Color.new('yellow2',        '#a9b159')
Color.new('blue0',          '#80a0ff')
Color.new('blue',           '#81a2be')
Color.new('aqua',           '#8ec07c')
Color.new('cyan',           '#8abeb7')
Color.new('purple',         '#8e6fbd')
Color.new('purple2',        '#bf67dd')
Color.new('violet',         '#b294bb')
Color.new('orange',         '#de935f')
Color.new('brown',          '#a3685a')
Color.new('gray',           '#777777')

Color.new('seagreen',       '#698b69')
Color.new('turquoise',      '#698b69')

Color.new('myred',          '#fb4934')
Color.new('myorange',       '#FFB454')
Color.new('status_bg',      '#333333')
Color.new('line',           '#21242A')
Color.new('line_nr',        '#181A1F')
Color.new('pmenu',          '#373b41')
Color.new('pmenuText',      '#b4b7b4')

---=[ Gruvbox ]=---

Color.new('pink',           '#e6b3b3')

Color.new('dark0_hard',  '#1d2021') -- 234     29-32-33
Color.new('dark0',       '#282828') -- 235     40-40-40
Color.new('dark0_soft',  '#32302f') -- 236     50-48-47
Color.new('dark1',       '#3c3836') -- 237     60-56-54
Color.new('dark2',       '#504945') -- 239     80-73-69
Color.new('dark3',       '#665c54') -- 241     102-92-84
Color.new('dark4',       '#7c6f64') -- 243     124-111-100
Color.new('dark4_256',   '#7c6f64') -- 243     124-111-100

Color.new('gray_245',    '#928374') -- 245     146-131-116
Color.new('gray_244',    '#928374') -- 244     146-131-116

Color.new('light0_hard', '#f9f5d7') -- 230     249-245-215
Color.new('light0',      '#fbf1c7') -- 229     253-244-193
Color.new('light0_soft', '#f2e5bc') -- 228     242-229-188
Color.new('light1',      '#ebdbb2') -- 223     235-219-178
Color.new('light2',      '#d5c4a1') -- 250     213-196-161
Color.new('light3',      '#bdae93') -- 248     189-174-147
Color.new('light4',      '#a89984') -- 246     168-153-132
Color.new('light4_256',  '#a89984') -- 246     168-153-132

Color.new('bright_red',     '#fb4934') -- 167   251-73-52
Color.new('bright_green',   '#b8bb26') -- 142   184-187-38
Color.new('bright_yellow',  '#fabd2f') -- 214   250-189-47
Color.new('bright_blue',    '#83a598') -- 109   131-165-152
Color.new('bright_purple',  '#d3869b') -- 175   211-134-155
Color.new('bright_aqua',    '#8ec07c') -- 108   142-192-124
Color.new('bright_orange',  '#fe8019') -- 208   254-128-25

Color.new('neutral_red',    '#cc241d') -- 124   204-36-29
Color.new('neutral_green',  '#98971a') -- 106   152-151-26
Color.new('neutral_yellow', '#d79921') -- 172   215-153-33
Color.new('neutral_blue',   '#458588') -- 66]   69-133-136
Color.new('neutral_purple', '#b16286') -- 132   177-98-134
Color.new('neutral_aqua',   '#689d6a') -- 72]   104-157-106
Color.new('neutral_orange', '#d65d0e') -- 166   214-93-14

Color.new('faded_red',      '#9d0006') -- 88]   157-0-6
Color.new('faded_green',    '#79740e') -- 100   121-116-14
Color.new('faded_yellow',   '#b57614') -- 136   181-118-20
Color.new('faded_blue',     '#076678') -- 24]   7-102-120
Color.new('faded_purple',   '#8f3f71') -- 96]   143-63-113
Color.new('faded_aqua',     '#427b58') -- 65]   66-123-88
Color.new('faded_orange',   '#af3a03') -- 130   175-58-3


---=[ Vim editor ]=---
Group.new('ColorColumn',                c.none,             c.status_bg,      s.NONE)   --  used for the columns set with 'colorcolumn'
Group.new('Conceal',                    c.gray,             c.background,     s.NONE)   --  placeholder characters substituted for concealed text
Group.new('Cursor',                     c.black,            c.myred,          s.NONE)   --  character under the cursor
Group.new('lCursor',                    c.black,            c.green,          s.NONE)   --  the character under the cursor when language-mapping is used
Group.new('CursorIM',                   c.black,            c.violet,         s.NONE)   --  like Cursor, but used when in IME mode
Group.new('CursorColumn',               c.none,             c.line,           s.NONE)   --  Screen-column at the cursor, when 'cursorcolumn' is set.
Group.new('CursorLine',                 c.none,             c.line,           s.NONE)   --  Screen-line at the cursor, when 'cursorline' is set.
Group.new('Directory',                  c.green,            c.background,     s.NONE)   --  directory names (and other special names in listings)
Group.new('EndOfBuffer',                c.foreground,       c.background,     s.NONE)   --  filler lines (~) after the end of the buffer.
Group.new('TermCursor',                 c.black,            c.myred,          s.NONE)   --  cursor in a focused terminal
Group.new('TermCursorNC',               c.black,            c.myred,          s.NONE)   --  cursor in an unfocused terminal
Group.new('ErrorMsg',                   c.myred,            c.background,     s.NONE)   --  error messages on the command line
Group.new('VertSplit',                  c.line,             c.background,     s.NONE)   --  the column separating vertically split windows
Group.new('Folded',                     c.gray,             c.background,     s.NONE)   --  line used for closed folds
Group.new('FoldColumn',                 c.gray,             c.background,     s.NONE)   --  foldcolumn
Group.new('SignColumn',                 c.foreground,       c.background,     s.NONE)   --  SignColumn column where signs are displayed
Group.new('IncSearch',                  c.black,            c.violet,         s.NONE)   --  'incsearch' highlighting; also used for the text replaced with ":s///c"
Group.new('Substitute',                 c.myorange,         c.background,     s.NONE)   --  substitute replacement text highlighting
Group.new('LineNr',                     c.status_bg,        c.background,     s.NONE)   --  Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
Group.new('CursorLineNr',               c.yellow,           c.background,     s.NONE)   --  Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line
Group.new('MatchParen',                 c.yellow,           c.background,     s.NONE)   --  The character under the cursor or just before it, if it is a paired bracket, and its match.
Group.new('ModeMsg',                    c.foreground,       c.background,     s.NONE)   --  'showmode' message (e.g., "-- INSERT --")
Group.new('MsgArea',                    c.foreground,       c.background,     s.NONE)   --  Area for messages and cmdline
Group.new('MsgSeparator',               c.white,            c.background,     s.NONE)   --  Separator for scrolled messages, `msgsep` flag of 'display'
Group.new('MoreMsg',                    c.foreground,       c.background,     s.NONE)   --  more-prompt
Group.new('NonText',                    c.foreground,       c.background,     s.NONE)   --  '@' at the end of the window, characters from 'showbreak'
Group.new('Normal',                     c.foreground,       c.background,     s.NONE)   --  normal text
Group.new('NormalFloat',                c.foreground,       c.line,           s.NONE)   --  Normal text in floating windows.
Group.new('NormalNC',                   c.foreground,       c.background,     s.NONE)   --  normal text in non-current windows
Group.new('Pmenu',                      c.pmenuText,        c.pmenu,          s.NONE)   --  Popup menu: normal item.
Group.new('PmenuSel',                   c.gray2,            c.yellow,         s.NONE)   --  Popup menu: selected item.
Group.new('PmenuSbar',                  c.gray,             c.pmenu,          s.NONE)   --  Popup menu: scrollbar.
Group.new('PmenuThumb',                 c.gray,             c.yellow,         s.NONE)   --  Popup menu: Thumb of the scrollbar.
Group.new('Question',                   c.foreground,       c.background,     s.NONE)   --  |hit-enter| prompt and yes/no questions
Group.new('QuickFixLine',               c.foreground,       c.background,     s.NONE)   --  Current |quickfix| item in the quickfix window. Combined with
Group.new('Search',                     c.black,            c.yellow,         s.NONE)   --  Last search pattern highlighting (see 'hlsearch').
Group.new('SpecialKey',                 c.line,             c.background,     s.NONE)   --  Unprintable characters: text displayed differently from what
Group.new('SpellBad',                   c.red,              c.background,     s.NONE)   --  Word that is not recognized by the spellchecker. |spell|
Group.new('SpellCap',                   c.yellow,           c.background,     s.NONE)   --  Word that should start with a capital. |spell|
Group.new('SpellLocal',                 c.myorange,         c.background,     s.NONE)   --  Word that is recognized by the spellchecker as one that is used in another region.
Group.new('SpellRare',                  c.aqua,             c.background,     s.NONE)   --  Word that is recognized by the spellchecker as one that is
Group.new('StatusLine',                 c.foreground,       c.status_bg,      s.NONE)   --  StatusLine status line of current window
Group.new('StatusLineNC',               c.foreground,       c.status_bg,      s.NONE)   --  status lines of not-current windows
Group.new('TabLineFill',                c.aqua,             c.status_bg,      s.NONE)   --  tab pages line, where there are no labels
Group.new('TabLine',                    c.gray,             c.status_bg,      s.NONE)   --  tab pages line, not active tab page label
Group.new('TabLineSel',                 c.myorange,         c.status_bg,      s.NONE)   --  tab pages line, active tab page label
Group.new('Title',                      c.foreground,       c.background,     s.NONE)   --  titles for output from ":set all", ":autocmd" etc.
Group.new('Visual',                     c.none,             c.line,           s.NONE)   --  Visual mode selection
Group.new('VisualNOS',                  c.none,             c.aqua,           s.NONE)   --  Visual mode selection when vim is "Not Owning the Selection".
Group.new('WarningMsg',                 c.orange,           c.background,     s.NONE)   --  warning messages
Group.new('Whitespace',                 c.line,             c.background,     s.NONE)   --  "nbsp", "space", "tab" and "trail" in 'listchars'
Group.new('WildMenu',                   c.yellow,           c.background,     s.NONE)   --  current match in 'wildmenu' completion

---=[ Custom ]=---
Group.new('Comment',                    c.blue0,            c.none,           s.italic)     -- any comment
Group.new('Constant',                   c.bright_blue,      c.none,           s.NONE)       -- any constant
Group.new('String',                     c.neutral_aqua,     c.none,           s.NONE)       -- a string constant: "this is a string"
Group.new('Character',                  c.bright_aqua,      c.none,           s.NONE)       -- a character constant: 'c', '\n'
Group.new('Number',                     c.bright_yellow,    c.none,           s.NONE)       -- a number constant: 234, 0xff
Group.new('Boolean',                    c.neutral_blue,     c.none,           s.NONE)       -- a boolean constant: TRUE, false
Group.new('Float',                      c.bright_yellow,    c.none,           s.NONE)       -- a floating point constant: 2.3e10

Group.new('Identifier',                 c.foreground,       c.none,           s.NONE)       -- any variable name
Group.new('Function',                   c.faded_yellow,     c.none,           s.NONE)        -- function name (also: methods for classes)

Group.new('Statement',                  c.dark3,            c.none,           s.NONE)       --  any statement
Group.new('Conditional',                c.faded_orange,     c.none,           s.NONE)       --  if, then, else, endif, switch, etc.
Group.new('Repeat',                     c.faded_orange,     c.none,           s.NONE)       --  for, do, while, etc.
Group.new('Label',                      c.faded_orange,     c.none,           s.NONE)       --  case, default, etc.
Group.new('Operator',                   c.faded_orange,     c.none,           s.NONE)       --  "sizeof", "+", "*", etc.
Group.new('Keyword',                    c.faded_orange,     c.none,           s.NONE)       --  any other keyword
Group.new('Exception',                  c.neutral_red,      c.none,           s.NONE)       --  try, catch, throw

Group.new('PreProc',                    c.foreground,       c.none,           s.NONE)       --  generic Preprocessor
Group.new('Include',                    c.foreground,       c.none,           s.NONE)       --  preprocessor #include
Group.new('Define',                     c.foreground,       c.none,           s.NONE)       --  preprocessor #define
Group.new('Macro',                      c.foreground,       c.none,           s.NONE)       --  same as Define
Group.new('PreCondit',                  c.foreground,       c.none,           s.NONE)       --  preprocessor #if, #else, #endif, etc.

Group.new('Type',                       c.foreground,       c.none,           s.italic)     --  int, long, char, etc.
Group.new('StorageClass',               c.foreground,       c.none,           s.NONE)       --  static, register, volatile, etc.
Group.new('Structure',                  c.foreground,       c.none,           s.NONE)       --  struct, union, enum, etc.
Group.new('Typedef',                    c.foreground,       c.none,           s.NONE)       --  A typedef

Group.new('Special',                    c.foreground,       c.none,           s.NONE)        --  any special symbol
Group.new('SpecialChar',                c.foreground,       c.none,           s.NONE)       --  special character in a constant
Group.new('Tag',                        c.foreground,       c.none,           s.NONE)       --  you can use CTRL-] on this
Group.new('Delimiter',                  c.foreground,       c.none,           s.NONE)       --  character that needs attention
Group.new('SpecialComment',             c.bright_blue,      c.none,           s.italic)       --  special things inside a comment
Group.new('Debug',                      c.foreground,       c.none,           s.NONE)       --  debugging statements

Group.new('Underlined',                 c.foreground,       c.none,           s.underline)  --  text that stands out, HTML links

Group.new('Ignore',                     c.foreground,       c.none,           s.NONE)       --  left blank, hidden  |hl-Ignore|

Group.new('Error',                      c.foreground,       c.none,           s.bold)       --  any erroneous construct

Group.new('Todo',                       c.dark0_hard,       c.light0_hard,    s.NONE)       --   anything that needs extra attention; mostly the keywords TODO FIXME and XXX

---=[ TreeSitter Highlighting ]=---
Group.new('TSAnnotation',               c.none,             c.bright_red,       s.NONE)
Group.new('TSAttribute',                c.bright_orange,    c.none,             s.NONE)
Group.new('TSBoolean',                  c.bright_purple,    c.none,             s.NONE)
Group.new('TSCharacter',                c.bright_green,     c.none,             s.NONE)
Group.new('TSConditional',              c.neutral_purple,   c.none,             s.NONE)
Group.new('TSConstant',                 c.faded_yellow,     c.none,             s.NONE)
Group.new('TSConstBuiltin',             c.bright_red,       c.none,             s.NONE)
Group.new('TSConstMacro',               c.bright_blue,      c.none,             s.NONE)
Group.new('TSConstructor',              c.bright_yellow,    c.none,             s.NONE)
Group.new('TSEmphasis',                 c.foreground,       c.bright_green,     s.NONE)
Group.new('TSError',                    c.none,             c.none,             s.underline)
Group.new('TSException',                c.bright_red,       c.none,             s.NONE)
Group.new('TSField',                    c.foreground,       c.bright_aqua,      s.NONE)
Group.new('TSFloat',                    c.neutral_yellow,   c.none,             s.NONE)
Group.new('TSFunction',                 c.bright_green,     c.none,             s.NONE)
Group.new('TSFuncBuiltin',              c.neutral_orange,   c.none,             s.NONE)
Group.new('TSFuncMacro',                c.dark3,            c.none,             s.NONE)
Group.new('TSInclude',                  c.dark3,            c.none,             s.NONE)
Group.new('TSKeyword',                  c.neutral_purple,   c.none,             s.NONE)
Group.new('TSKeywordFunction',          c.neutral_orange,   c.none,             s.NONE)
Group.new('TSKeywordOperator',          c.neutral_orange,   c.none,             s.NONE)
Group.new('TSLabel',                    c.light2,           c.none,             s.NONE)
Group.new('TSLiteral',                  c.foreground,       c.yellow,           s.NONE)
Group.new('TSMethod',                   c.bright_green,     c.none,             s.NONE)
Group.new('TSNamespace',                c.foreground,       c.bright_aqua,      s.NONE)
Group.new('TSNumber',                   c.bright_yellow,    c.none,             s.NONE)
Group.new('TSOperator',                 c.foreground,       c.none,             s.NONE)
Group.new('TSParameter',                c.bright_blue,      c.none,             s.NONE)
Group.new('TSParameterReference',       c.foreground,       c.faded_green,      s.NONE)
Group.new('TSProperty',                 c.light1,           c.none,             s.NONE)
Group.new('TSPunctBracket',             c.dark3,            c.none,             s.NONE)
Group.new('TSPunctDelimiter',           c.dark3,            c.none,             s.NONE)
Group.new('TSPunctSpecial',             c.dark3,            c.none,             s.NONE)
Group.new('TSRepeat',                   c.bright_purple,    c.none,             s.NONE)
Group.new('TSString',                   c.neutral_green,    c.none,             s.NONE)
Group.new('TSStringEscape',             c.bright_orange,    c.none,             s.NONE)
Group.new('TSStringRegex',              c.bright_purple,    c.none,             s.NONE)
Group.new('TSStrong',                   c.foreground,       c.faded_purple,     s.NONE)
Group.new('TSStructure',                c.foreground,       c.faded_aqua,       s.NONE)
Group.new('TSTag',                      c.light2,           c.none,             s.NONE)
Group.new('TSTagDelimiter',             c.dark3,            c.none,             s.NONE)
Group.new('TSText',                     c.foreground,       c.bright_aqua,      s.NONE)
Group.new('TSTitle',                    c.foreground,       c.bright_orange,    s.NONE)
Group.new('TSType',                     c.bright_yellow,    c.none,             s.NONE)
Group.new('TSTypeBuiltin',              c.bright_orange,    c.none,             s.NONE)
Group.new('TSUnderline',                c.pink,             c.none,             s.NONE)
Group.new('TSURI',                      c.foreground,       c.faded_orange,     s.NONE)
Group.new('TSVariable',                 c.bright_blue,      c.none,             s.NONE)
Group.new('TSVariableBuiltin',          c.bright_orange,    c.none,             s.italic)

---=[ Vim Help ]=---

---=[ Custom ]=---
Group.new('StatusLineLHS',              c.myorange,         c.status_bg,      s.NONE)
Group.new('StatusLineRHS',              c.black,            c.white2,         s.NONE)
Group.new('StatusLineMOD',              c.myred,            c.status_bg,      s.NONE)
Group.new('StatusLineRO',               c.myred,            c.status_bg,      s.NONE)
Group.new('StatusLineLinter',           c.myred,            c.status_bg,      s.NONE)

Group.new('StatusLineModeNormal',       c.myorange,         c.status_bg,      s.NONE)
Group.new('StatusLineModeVisual',       c.status_bg,        c.myorange,       s.NONE)
Group.new('StatusLineModeInsert',       c.status_bg,        c.green,          s.NONE)
Group.new('StatusLineModeReplace',      c.status_bg,        c.cyan,           s.NONE)
Group.new('StatusLineModeCommand',      c.status_bg,        c.violet,         s.NONE)
Group.new('StatusLineLow',              c.gray,             c.status_bg,      s.NONE)

Group.new('StatusLineLspInfo',          c.cyan,             c.status_bg,      s.NONE)
Group.new('StatusLineLspHint',          c.white,            c.status_bg,      s.NONE)
Group.new('StatusLineLspWarn',          c.myorange,         c.status_bg,      s.NONE)
Group.new('StatusLineLspError',         c.myred,            c.status_bg,      s.NONE)

Group.new('TabLineMod',                 c.myred,            c.status_bg,      s.NONE)
Group.new('TabLineModBuf',              c.cyan,             c.status_bg,      s.NONE)
Group.new('TabLineModNone',             c.white,            c.status_bg,      s.NONE)

---=[ Diff ]=---
Group.new('DiffAdd',                    c.green,            c.background,     s.NONE)
Group.new('DiffChange',                 c.yellow,           c.background,     s.NONE)
Group.new('DiffDelete',                 c.myred,            c.background,     s.NONE)
Group.new('DiffText',                   c.myorange,         c.background,     s.NONE)

---=[ Git ]=---
Group.new('GitGutterAdd',               g.DiffAdd,          g.DiffAdd,        s.NONE)
Group.new('GitGutterChange',            g.DiffChange,       g.DiffChange,     s.NONE)
Group.new('GitGutterDelete',            g.DiffDelete,       g.DiffDelete,     s.NONE)


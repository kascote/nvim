"---[ General ]----------------------------------------------------------- {{{
let $LANG = 'en'
set autowrite                                               " Automatically save before commands like :next and :make
set encoding=utf-8 nobomb
setglobal fenc=utf8
set history=100                                             " keep lines of command line history
set ignorecase                                              " Do case insensitive search matching
set smartcase
set showcmd                                                 " Show (partial) command in status line.
set synmaxcol=500                                           " limit sintax color to N columns
let $S = $HOME . '/vimfiles/sessions'
set tags=tags,vim_tags;~/                                   " Look for the file in the current directory, then south until you reach home.
set ttimeout
set timeoutlen=500                                          " Quick timeouts on key combinations.
set ttimeoutlen=0                                           " ESC timout on neovim
set hidden                                                  " permit switch buffers without save it before
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways
set modeline                                                " Use modeline overrides
set wildcharm=<C-z>                                         " substitute for 'wildchar' (<Tab>) in macros
set clipboard=unnamedplus
set updatetime=400
set noemoji

"let macvim_hig_shift_movement = 1                          " MacVIM shift+arrow-keys behavior (required in .vimrc)
"}}}
"---[ File / Bakcups ]---------------------------------------------------- {{{
set nobackup                                                " remove backups after close
set nowritebackup                                           " disable backup file
set backupcopy=no                                           " keep a backup file
set backupdir=~/.local/share/nvim/tmp/
set noswapfile                                              " disable swap file
set directory=~/.local/share/nvim/tmp/                      " where store swap files
"set swapsync=                                               " let OS sync swapfiles lazily
set undofile                                                " Save undo's after file closes
set undodir=~/.local/share/nvim/undo                        " where to save undo histories
set undolevels=1000                                         " How many undos
set undoreload=10000                                        " number of lines to save for undo
set makeef=error.err
"set viminfo+=n~/.local/share/nvim/tmp/                     " where store info files
"}}}
"---[ VIM UI]------------------------------------------------------------- {{{
set winaltkeys=no                                           " disable alt shorcuts on menus
set wildmenu                                                " turn on wild menu
"set wildmode=list:longest,list:full
set wildmode=longest:full,full
"Ignore these files when completing names and in Explorer
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.aux,*.out,*.toc,*.pyc,.DS_Store
set wildignore+=*.jpg,*.png,*.xpm,*.gif,*.psd
set wildignore+=*.zip,*.bz2,*.tar,*.gz,*.rar
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" set wildignore+=*/tmp/*                                     " Ignore rails temporary asset caches
set wildignore+=*/public/assets/*
set wildignore+=*/.tmp/*
" set wildignore+=*/dist/*
" set wildignore+=*/resources/*                               " Ignore custom folders
set wildignore+=*/node_modules/*                            " Ignore node modules
set wildignore+=*/bower_modules/*
set wildignore+=*.swp,*~,._*,*.bak                          " Disable temp and backup files
set completeopt=menuone,noinsert,noselect                   " Set completeopt to have a better completion experience
set ruler                                                   " Always show current positions along the bottom
set cmdheight=2                                             " the command bar is 2 high
" set number                                                  " turn on line numbers
" set relativenumber                                          " turn relative numbers on"
set numberwidth=5                                           " staring widh for numbers on gutter
set lazyredraw                                              " do not redraw while running macros (much faster) (LazyRedraw)
set hid                                                     " you can change buffer without saving
set backspace=indent,start,eol                              " allow unrestricted backspacing in insert mode
"set whichwrap+=<,>,h,l                                     " backspace and cursor keys wrap to
set whichwrap=b,h,l,s,<,>,[,],~                             " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set mouse=a                                                 " use mouse everywhere
set shortmess+=A                                            " ignore annoying swapfile messages
set shortmess+=I                                            " no splash screen
set shortmess+=O                                            " file-read message overwrites previous
set shortmess+=T                                            " truncate non-file messages in middle
set shortmess+=W                                            " don't echo "[w]"/"[written]" when writing
set shortmess+=a                                            " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=c                                            " completion messages
set shortmess+=o                                            " overwrite file-written messages
set shortmess+=t                                            " truncate file messages at start
" set report=0                                                " tell us when anything is changed via :...
set fillchars=vert:┃,stl:\ ,stlnc:\                         " make the splitters between windows be blank
set winminheight=0                                          " The minimal height of a window, when it's not the current window.
set linebreak                                               " wrap long lines at characters in 'breakat'
set title                                                   " set terminal title
set virtualedit=block                                       " allow cursor to move where there is no text in visual block mode
set cursorline                                              " color the current line
set splitbelow                                              " open horizontal splits below current window
set splitright                                              " open vertical splits to the right of the current window
set signcolumn=yes:2                                        " always show 2 sign columns
set noshowmode                                              " remove last line mode
set showtabline=2                                           " always enable tablines
if has('gui_running')
  set guioptions+=m           " menu bar
  set guioptions+=g           " grey menu disabled menu items
  set guioptions+=t           " tearoff menus
  set guioptions-=T           " disable toolbar
  set guioptions+=a           " Vim selection to OS clipboard, modeless
  set guioptions+=c           " console dialogs
  set guioptions-=l           " left scrollbar
  set guioptions-=L           " left scrollbar
  set guioptions-=r           " right scrollbar
  set guioptions-=b           " bottom scrollbar
  if has('gui_macvim')
    set fuoptions=maxvert,maxhorz
  endif
endif

" if &term =~ '256color'
"   " disable Background Color Erase (BCE) so that color schemes
"   " render properly when inside 256-color tmux and GNU screen.
"   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"   set t_ut=
" endif

if has("termguicolors")
  set termguicolors                                         " use guifg/guibg instead of ctermfg/ctermbg in terminal
endif


set guicursor=                                              " do not mess with the cursor size
"}}}
"---[ Visual Cues ]------------------------------------------------------- {{{
set showmatch                                               " show matching brackets
set matchtime=5                                             " how many tenths of a second to blink matching brackets for
set hlsearch                                                " highlight searchs
set incsearch                                               " BUT do highlight as you type you search phrase
set nolist                                                  " show whitespace
"set listchars=tab:\>-,trail:.,extends:>,precedes:<,eol:$,nbsp:º " what to show when I hit :set list
set listchars=tab:\▷┅,trail:•,extends:»,precedes:«,eol:$,nbsp:⦸ " what to show when I hit :set list
set nojoinspaces                                            " don't autoinsert two spaces after '.', '?', '!' for join command
if has('linebreak')
  let &showbreak='↳ '                                       " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif
set noshowcmd                                               " don't show extra info at end of command line
set breakindent                                             " indent wrapped lines to match start
set breakindentopt=shift:2                                  " emphasize broken lines by indenting them
set scrolloff=3                                             " Keep 10 lines (top/bottom) for scope
set sidescrolloff=3                                         " same as scrolloff, but for columns
set novisualbell                                            " don't blink
set noerrorbells                                            " no noises
set belloff=all                                             " shut up!
set novisualbell                                            " stop annoying beeping for non-error errors
set laststatus=2                                            " always show the status line
" For conceal markers.
if has('conceal')
  set conceallevel=2
  set concealcursor=
endif

if !has('nvim')
  " Sync with corresponding nvim :highlight commands in ~/.vim/plugin/autocmds.vim:
  set highlight+=@:Conceal            " ~/@ at end of window, 'showbreak'
  set highlight+=D:Conceal            " override DiffDelete
  set highlight+=N:FoldColumn         " make current line number stand out a little
  set highlight+=c:LineNr             " blend vertical separators with line numbers
endif

"}}}
"---[ Text Formatting/Layout ]-------------------------------------------- {{{
set formatoptions=tcroqnlMj                                   " See Help (complex)
set autoindent                                              " autoindent
set smartindent                                             " smartindent
set shiftround                                              " indent to the closest shiftwidth
set cindent                                                 " do c-style indenting
set tabstop=2                                               " tab spacing (settings below are just to unify it)
set shiftwidth=2                                            " unify
set softtabstop=-1                                          " use 'shiftwidth' for tab/bs at end of line
set nowrap                                                  " do not wrap lines
set smarttab                                                " use tabs at the start of a line, spaces elsewhere
set expandtab                                               " tabs to spaces
set scrolljump=3                                            " Jump 5 lines when running out of the screen
set scrolloff=3                                             " Indicate jump out of the screen when 3 lines before end of the screen
set textwidth=200                                           " Line with
set spellcapcheck=                                          " don't check for capital letters at start of sentence
set spelloptions=camel                                      " setup spell to support camel case check
"}}}
"---[ Folding ]----------------------------------------------------------- {{{
" Enable folding, but by default make it act like folding is off, because folding is annoying in anything but a few rare cases
set foldenable                                              " Turn on folding
" foldmethod is setup on lua/lsp.lua
" set foldmethod=indent                                       " Make folding indent sensitive
set foldnestmax=10
set foldlevelstart=99                                       " where start to fold a new buffer. 99 = unfolded
set foldtext=nfx#utils#NeatFoldText()
"set foldlevel=1                                            " Don't autofold anything (but I can still fold manually)
set foldclose=all                                            " Autoclose folds, when moving out of them
if has('nvim')
  set inccommand=split                                      " incremental command live feedback
endif

"}}}


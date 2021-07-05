 local u = require('nfx.utils')

 --=[ do not load some plugins]=-----------------------------------------------
vim.g.loaded_gzip              = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_zipPlugin         = 1

--=[ General ]=--
vim.g.mapleader      = u.termcodes('<Space>')
vim.g.maplocalleader = u.termcodes("<BS>")
vim.g.shada          = { "!", "'1000", "<50", "s10", "h", "f" }
vim.o.autowrite      = true                   -- Automatically save before commands like :next and :make
vim.o.encoding       = "utf-8"
vim.o.fenc           = "utf-8"
vim.o.history        = 100                    -- keep lines of command line history
vim.o.ignorecase     = true                   -- Do case insensitive search matching
vim.o.smartcase      = true                   -- TODO
vim.o.showcmd        = true                   -- Show (partial) command in status line.
vim.o.synmaxcol      = 500                    -- limit sintax color to N columns
vim.o.ttimeout       = true
vim.o.timeoutlen     = 500                    -- Quick timeouts on key combinations.
vim.o.ttimeoutlen    = 0                      -- ESC timout on neovim
vim.o.hidden         = true                   -- permit switch buffers without save it before
-- vim.o.modeline                             -- use modeline overrides
vim.o.clipboard      = 'unnamedplus'
vim.o.updatetime     = 400
vim.g.noemoji        = true                   -- consider that not all emojis take up full width

--=[ File / Backup ]=--
vim.o.writebackup    = true                   -- remove backup after close
vim.o.backupcopy     = 'no'                   -- keep a backup file
vim.o.swapfile       = false                  -- disable swap file
-- vim.o.swapsync    = true                   -- let OS sync swapfiles lazily
vim.o.undofile       = true                   -- Save undo's after file closes
vim.o.undolevels     = 1000                   -- How many undos
vim.o.undoreload     = 10000                  -- number of lines to save for undo

--=[ VIM UI ]=--
vim.o.wildmenu       = true                         -- turn on wild menu
vim.o.wildmode       = 'longest:full,full,list'
vim.o.pumblend       = 0
vim.o.pumheight      = 20
vim.o.pumwidth       = 20
-- Ignore these files when completing names and in Explorer
vim.o.wildignore     = vim.o.wildignore .. '.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la'
vim.o.wildignore     = vim.o.wildignore .. '*.so,*.obj,*.aux,*.out,*.toc,*.pyc,.DS_Store'
vim.o.wildignore     = vim.o.wildignore .. '*.jpg,*.png,*.xpm,*.gif,*.psd'
vim.o.wildignore     = vim.o.wildignore .. '*.zip,*.bz2,*.tar,*.gz,*.rar'
vim.o.wildignore     = vim.o.wildignore .. '*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*'
-- set wildignore+=*/tmp/*
vim.o.wildignore     = vim.o.wildignore .. '*/public/assets/*'
vim.o.wildignore     = vim.o.wildignore .. '*/.tmp/*'
-- set wildignore+=*/dist/*
-- set wildignore+=*/resources/*
vim.o.wildignore     = vim.o.wildignore .. '*/node_modules/*'
vim.o.wildignore     = vim.o.wildignore .. '*/bower_modules/*'
vim.o.wildignore     = vim.o.wildignore .. '*.swp,*~,._*,*.bak'
vim.o.completeopt    = 'menuone,noinsert,noselect'       -- Set completeopt to have a better completion experience
vim.o.ruler          = false                  -- Always show current positions along the bottom
vim.o.cmdheight      = 2                      -- the command bar is 2 high
vim.wo.number        = true                   -- turn on line numbers
vim.wo.relativenumber = true                  -- turn relative numbers on"
vim.o.numberwidth    = 4                      -- staring widh for numbers on gutter
vim.o.lazyredraw     = true                   -- do not redraw while running macros
vim.o.backspace      = 'indent,start,eol'     -- allow unrestricted backspacing in insert mode
vim.o.whichwrap      = 'b,h,l,s,<,>,[,],~'    -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.o.mouse          = 'a'                    -- use mouse everywhere
vim.o.shortmess = vim.o.shortmess .. 'A'      -- ignore annoying swapfile messages
vim.o.shortmess = vim.o.shortmess .. 'I'      -- no splash screen
vim.o.shortmess = vim.o.shortmess .. 'O'      -- file-read message overwrites previous
vim.o.shortmess = vim.o.shortmess .. 'T'      -- truncate non-file messages in middle
vim.o.shortmess = vim.o.shortmess .. 'W'      -- don't echo "[w]"/"[written]" when writing
vim.o.shortmess = vim.o.shortmess .. 'a'      -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.o.shortmess = vim.o.shortmess .. 'c'      -- completion messages
vim.o.shortmess = vim.o.shortmess .. 'o'      -- overwrite file-written messages
vim.o.shortmess = vim.o.shortmess .. 't'      -- truncate file messages at start
-- set report=0                               -- tell us when anything is changed via :...
-- vim.o.fillchars      = [[eob:~,vert:│,stl: ,stlnc: ]]
vim.o.fillchars      = [[eob:~,vert:│,stl: ]]
vim.o.winminheight   = 0                      -- The minimal height of a window, when its not the current window.
vim.o.linebreak      = true                   -- wrap long lines at characters in 'breakat'
vim.o.title          = true                   -- set terminal title
vim.o.virtualedit    = 'block'                -- allow cursor to move where there is no text in visual block mode
vim.o.cursorline     = true                   -- color the current line
vim.o.splitbelow     = true                   -- open horizontal splits below current window
vim.o.splitright     = true                   -- open vertical splits to the right of the current window
vim.wo.signcolumn    = 'yes:2'                -- always show 2 sign columns
vim.o.showmode       = false                  -- remove last line mode
--vim.o.showtabline    = 2                      -- always enable tablines
vim.o.termguicolors  = true

--= [ Visual Cues ]=--
vim.o.showmatch      = true                   -- show matching brackets
vim.o.matchtime      = 5                      -- how many tenths of a second to blink matching brackets for
vim.o.hlsearch       = true                   -- highlight searchs
vim.o.incsearch      = true                   -- BUT do highlight as you type you search phrase
vim.wo.list          = true                   -- show whitespace
vim.o.listchars      = [[tab:\▷┅,trail:•,extends:…,precedes:…,eol:↲,nbsp:⦸]] -- " what to show when I hit :set list

vim.o.showbreak      = '↳  '
vim.o.showcmd        = false                  -- don't show extra info at end of command line
vim.o.breakindent    = true                   -- indent wrapped lines to match start
vim.o.breakindentopt = 'shift:2'              -- emphasize broken lines by indenting them
vim.o.scrolloff      = 3                      -- Keep 10 lines (top/bottom) for scope
vim.o.sidescrolloff  = 3                      -- same as scrolloff, but for columns
vim.o.visualbell     = false                  -- don't blink
vim.o.errorbells     = false                  -- no noises
vim.o.belloff        = 'all'                  -- shut up!
vim.o.laststatus     = 2                      -- always show the status line
vim.o.conceallevel   = 2
vim.o.concealcursor  = ''

--=[ Text Formatting/Layout ]=--
vim.o.formatoptions = 'crqnlMj'               -- See Help (complex) TODO
vim.o.joinspaces    = false                   -- don't autoinsert two spaces after '.', '?', '!' for join command
vim.o.autoindent    = true                    -- autoindent
vim.o.expandtab     = true                    -- tabs to spaces
vim.o.smartindent   = true                    -- smartindent
vim.o.shiftround    = true                    -- indent to the closest shiftwidth
vim.o.cindent       = true                    -- do c-style indenting
vim.o.tabstop       = 2                       -- tab spacing (settings below are just to unify it)
vim.o.shiftwidth    = 2                       -- unify
vim.o.softtabstop   = -1                      -- use 'shiftwidth' for tab/bs at end of line
-- https://github.com/neovim/neovim/issues/12978
vim.cmd [[
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set shiftround
set cindent
set softtabstop=-1
set tabstop=2
]]
vim.wo.wrap         = false                   -- do not wrap lines
vim.o.smarttab      = true                    -- use tabs at the start of a line, spaces elsewhere
vim.o.scrolljump    = 3                       -- Jump 5 lines when running out of the screen
vim.o.textwidth     = 200                     -- Line with
vim.o.spellcapcheck = ''                      -- don't check for capital letters at start of sentence
vim.o.spelloptions  = 'camel'                 -- setup spell to support camel case check

--=[ Folding ]=--
vim.o.foldenable     = true                   -- Turn on folding
-- foldmethod is setup on lua/lsp.lua
-- vim.o.foldmethod  = indent                 -- Make folding indent sensitive
vim.o.foldnestmax    = 10                     --
vim.o.foldlevelstart = 99                     -- where start to fold a new buffer. 99 = unfolded
-- vim.o.foldtext    = nfx#utils#NeatFoldText()
vim.wo.foldlevel     = 1                      -- Don't autofold anything (but I can still fold manually)
vim.o.foldclose      = 'all'                  -- Autoclose folds, when moving out of them
vim.o.inccommand     = 'split'                -- incremental command live feedback


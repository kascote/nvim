local u = require('nfx.utils')
local O = vim.opt
local G = vim.opt_global

--=[ do not load some plugins]=-----------------------------------------------
vim.g.loaded_gzip              = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1

--=[ General ]=--
vim.g.mapleader      = u.termcodes('<Space>')
vim.g.maplocalleader = u.termcodes("<BS>")
-- O.shada  = { "!", "'1000", "<50", "s10", "h", "f" }
vim.g.shada      = "!,'1000,<50,s10,h,f1"
G.autowrite      = true                   -- Automatically save before commands like :next and :make
G.encoding       = "utf-8"
O.fileencoding   = "utf-8"
G.history        = 900                    -- keep lines of command line history -- set by plugin Loupe
G.ignorecase     = true                   -- Do case insensitive search matching
G.smartcase      = true                   -- TODO
O.synmaxcol      = 500                    -- limit sintax color to N columns
G.ttimeout       = true
O.timeoutlen     = 500                    -- Quick timeouts on key combinations.
G.ttimeoutlen    = 0                      -- ESC timout on neovim
G.hidden         = true                   -- permit switch buffers without save it before
O.modeline       = false                  -- use modeline overrides
G.clipboard      = 'unnamedplus'
G.updatetime     = 400
vim.g.noemoji    = true                   -- consider that not all emojis take up full width

--=[ File / Backup ]=--
G.writebackup    = true                   -- remove backup after close
G.backupcopy     = 'no'                   -- keep a backup file
O.swapfile       = false                  -- disable swap file
-- vim.o.swapsync    = true                   -- let OS sync swapfiles lazily
O.undofile       = true                   -- Save undo's after file closes
O.undolevels     = 1000                   -- How many undos
G.undoreload     = 10000                  -- number of lines to save for undo

--=[ VIM UI ]=--
G.wildmenu       = true                         -- turn on wild menu
G.wildmode       = 'longest:full,full,list'
G.pumblend       = 0
G.pumheight      = 20
G.pumwidth       = 20
-- Ignore these files when completing names and in Explorer
G.wildignore     = G.wildignore + '.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la'
G.wildignore     = G.wildignore + '*.so,*.obj,*.aux,*.out,*.toc,*.pyc,.DS_Store'
G.wildignore     = G.wildignore + '*.jpg,*.png,*.xpm,*.gif,*.psd'
G.wildignore     = G.wildignore + '*.zip,*.bz2,*.tar,*.gz,*.rar'
G.wildignore     = G.wildignore + '*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*'
-- set wildignore+=*/tmp/*
G.wildignore     = G.wildignore + '*/public/assets/*'
G.wildignore     = G.wildignore + '*/.tmp/*'
-- set wildignore+=*/dist/*
-- set wildignore+=*/resources/*
G.wildignore     = G.wildignore + '*/node_modules/*'
G.wildignore     = G.wildignore + '*/bower_modules/*'
G.wildignore     = G.wildignore + '*.swp,*~,._*,*.bak'
G.completeopt    = 'menuone,noinsert,noselect'       -- Set completeopt to have a better completion experience
G.ruler          = false                  -- Always show current positions along the bottom
G.cmdheight      = 2                      -- the command bar is 2 high
O.number         = true                   -- turn on line numbers
O.relativenumber = true                  -- turn relative numbers on"
O.numberwidth    = 4                      -- staring widh for numbers on gutter
G.lazyredraw     = true                   -- do not redraw while running macros
G.backspace      = 'indent,start,eol'     -- allow unrestricted backspacing in insert mode
G.whichwrap      = 'b,h,l,s,<,>,[,],~'    -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
G.mouse          = 'a'                    -- use mouse everywhere
G.shortmess      = G.shortmess + 'A'      -- ignore annoying swapfile messages
G.shortmess      = G.shortmess + 'I'      -- no splash screen
G.shortmess      = G.shortmess + 'O'      -- file-read message overwrites previous
G.shortmess      = G.shortmess + 'T'      -- truncate non-file messages in middle
G.shortmess      = G.shortmess + 'W'      -- don't echo "[w]"/"[written]" when writing
G.shortmess      = G.shortmess + 'a'      -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
G.shortmess      = G.shortmess + 'c'      -- completion messages
G.shortmess      = G.shortmess + 'o'      -- overwrite file-written messages
G.shortmess      = G.shortmess + 't'      -- truncate file messages at start
-- set report=0                               -- tell us when anything is changed via :...
O.fillchars      = { eob = '~', vert = "│", stl = ' ', stlnc = ' ' }
G.winminheight   = 0                      -- The minimal height of a window, when its not the current window.
O.linebreak      = true                   -- wrap long lines at characters in 'breakat'
G.title          = false                   -- set terminal title
G.titlestring    = '%<%t'                 -- set titlestring to show filename only
G.titlelen       = 10
G.virtualedit    = 'block'                -- allow cursor to move where there is no text in visual block mode
O.cursorline     = true                   -- color the current line
G.splitbelow     = true                   -- open horizontal splits below current window
G.splitright     = true                   -- open vertical splits to the right of the current window
O.signcolumn    = 'yes:2'                 -- always show 2 sign columns
O.showmode       = false                  -- remove last line mode
--vim.o.showtabline    = 2                      -- always enable tablines
G.termguicolors  = true

--= [ Visual Cues ]=--
O.showmatch      = true                   -- show matching brackets
G.matchtime      = 5                      -- how many tenths of a second to blink matching brackets for
G.hlsearch       = true                   -- highlight searchs
G.incsearch      = true                   -- BUT do highlight as you type you search phrase
O.list          = true                   -- show whitespace
O.listchars      = { tab = '▷┅', trail = '•', extends = '…', precedes = '…', eol = '↲', nbsp = '⦸' } -- " what to show when I hit :set list

G.showbreak      = '↳  '
G.showcmd        = false                  -- don't show extra info at end of command line
O.breakindent    = true                   -- indent wrapped lines to match start
O.breakindentopt = 'shift:2'              -- emphasize broken lines by indenting them
O.scrolloff      = 3                      -- Keep 10 lines (top/bottom) for scope
O.sidescrolloff  = 3                      -- same as scrolloff, but for columns
G.visualbell     = false                  -- don't blink
G.errorbells     = false                  -- no noises
G.belloff        = 'all'                  -- shut up!
G.laststatus     = 3                      -- always show the status line (is set with LuaLine plugin)
O.conceallevel   = 2
O.concealcursor  = ''

--=[ Text Formatting/Layout ]=--
O.formatoptions = 'crqnlMj'               -- See Help (complex) TODO
G.joinspaces    = false                   -- don't autoinsert two spaces after '.', '?', '!' for join command
O.autoindent    = true                    -- autoindent
O.expandtab     = true                    -- tabs to spaces
O.smartindent   = true                    -- smartindent
G.shiftround    = true                    -- indent to the closest shiftwidth
O.cindent       = true                    -- do c-style indenting
O.tabstop       = 2                       -- tab spacing (settings below are just to unify it)
O.shiftwidth    = 2                       -- unify
O.softtabstop   = -1                      -- use 'shiftwidth' for tab/bs at end of line
-- https://github.com/neovim/neovim/issues/12978
O.autoindent    = true
O.expandtab     = true
O.shiftwidth    = 2
O.smartindent   = true
G.shiftround    = true
O.cindent       = true
O.softtabstop   = -1
O.tabstop       = 2
O.wrap          = false                   -- do not wrap lines
G.smarttab      = true                    -- use tabs at the start of a line, spaces elsewhere
G.scrolljump    = 3                       -- Jump 5 lines when running out of the screen
O.textwidth     = 200                     -- Line with
O.spellcapcheck = ''                      -- don't check for capital letters at start of sentence
O.spelloptions  = 'camel'                 -- setup spell to support camel case check

--=[ Folding ]=--
O.foldenable     = true                   -- Turn on folding
-- foldmethod is setup on lua/lsp.lua
-- vim.o.foldmethod  = indent                 -- Make folding indent sensitive
O.foldnestmax    = 10                     --
G.foldlevelstart = 99                     -- where start to fold a new buffer. 99 = unfolded
-- vim.o.foldtext    = nfx#utils#NeatFoldText()
O.foldlevel      = 1                      -- Don't autofold anything (but I can still fold manually)
G.foldclose      = 'all'                  -- Autoclose folds, when moving out of them
G.inccommand     = 'split'                -- incremental command live feedback

-- do not create default mappings for endwise
vim.g.endwise_no_mappings=1
-- vim.g.kommentary_create_default_mappings = false

local u                       = require('nv.utils')

--=[ do not load some plugins]=-----------------------------------------------
vim.g.loaded_gzip             = 1
vim.g.loaded_zip              = 1
vim.g.loaded_zipPlugin        = 1
vim.g.loaded_tar              = 1
vim.g.loaded_tarPlugin        = 1
vim.g.loaded_netrw            = 1
vim.g.loaded_netrwPlugin      = 1
vim.g.loaded_netrwSettings    = 1
vim.g.loaded_tarPlugin        = 1
vim.g.loaded_2html_plugin     = 1
vim.g.loaded_vimball          = 1
vim.g.loaded_vimballPlugin    = 1
vim.g.loaded_man              = 1
vim.g.loaded_matchit          = 1

vim.g.loaded_perl_provider    = 0

vim.g.syntax_on               = 0

--=[ General ]=--
vim.g.mapleader               = u.termcodes('<Space>')
vim.g.maplocalleader          = u.termcodes("<BS>")
-- vim.opt.shada  = { "!", "'1000", "<50", "s10", "h", "f" }
vim.g.shada                   = "!,'1000,<50,s10,h,f1"
vim.opt_global.autowrite      = true -- Automatically save before commands like :next and :make
vim.opt_global.encoding       = "utf-8"
vim.opt.fileencoding          = "utf-8"
vim.opt_global.history        = 900 -- keep lines of command line history -- set by plugin Loupe
vim.opt_global.ignorecase     = true -- Do case insensitive search matching
vim.opt_global.smartcase      = true -- TODO
vim.opt.synmaxcol             = 500 -- limit sintax color to N columns
vim.opt_global.ttimeout       = true
vim.opt.timeoutlen            = 500 -- Quick timeouts on key combinations.
vim.opt_global.ttimeoutlen    = 0 -- ESC timout on neovim
vim.opt_global.hidden         = true -- permit switch buffers without save it before
vim.opt.modeline              = false -- use modeline overrides
vim.opt_global.clipboard      = 'unnamedplus'
vim.opt_global.updatetime     = 400
vim.g.noemoji                 = true -- consider that not all emojis take up full width

--=[ File / Backup ]=--
vim.opt_global.writebackup    = true -- remove backup after close
vim.opt_global.backupcopy     = 'no' -- keep a backup file
vim.opt.swapfile              = false -- disable swap file
-- vim.o.swapsync               = true                   -- let OS sync swapfiles lazily
vim.opt.undofile              = true -- Save undo's after file closes
vim.opt.undolevels            = 1000 -- How many undos
vim.opt_global.undoreload     = 10000 -- number of lines to save for undo

--=[ VIM UI ]=--
vim.opt_global.wildmenu       = true -- turn on wild menu
vim.opt_global.wildmode       = 'longest:full,full,list'
vim.opt_global.pumblend       = 0
vim.opt_global.pumheight      = 20
vim.opt_global.pumwidth       = 20
-- Ignore these files when completing names and in Explorer
vim.opt_global.wildignore     = vim.opt_global.wildignore + '.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la'
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*.so,*.obj,*.aux,*.out,*.toc,*.pyc,.DS_Store'
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*.jpg,*.png,*.xpm,*.gif,*.psd'
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*.zip,*.bz2,*.tar,*.gz,*.rar'
vim.opt_global.wildignore     = vim.opt_global.wildignore +
    '*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*'
-- set wildignore+=*/tmp/*
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*/public/assets/*'
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*/.tmp/*'
-- set wildignore+=*/dist/*
-- set wildignore+=*/resources/*
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*/node_modules/*'
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*/bower_modules/*'
vim.opt_global.wildignore     = vim.opt_global.wildignore + '*.swp,*~,._*,*.bak'
vim.opt_global.completeopt    = 'menuone,noinsert,noselect' -- Set completeopt to have a better completion experience
vim.opt_global.ruler          = false -- Always show current positions along the bottom
vim.opt_global.cmdheight      = 2 -- the command bar is 2 high
vim.opt.number                = false -- turn on line numbers
vim.opt.relativenumber        = false -- turn relative numbers on"
vim.opt.numberwidth           = 4 -- staring widh for numbers on gutter
vim.opt_global.lazyredraw     = false -- do not redraw while running macros
vim.opt_global.backspace      = 'indent,start,eol' -- allow unrestricted backspacing in insert mode
vim.opt_global.whichwrap      = 'b,h,l,s,<,>,[,],~' -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.opt_global.mouse          = 'a' -- use mouse everywhere
vim.opt_global.shortmess      = vim.opt_global.shortmess + 'A' -- ignore annoying swapfile messages
vim.opt_global.shortmess      = vim.opt_global.shortmess + 'I' -- no splash screen
vim.opt_global.shortmess      = vim.opt_global.shortmess + 'O' -- file-read message overwrites previous
vim.opt_global.shortmess      = vim.opt_global.shortmess + 'T' -- truncate non-file messages in middle
vim.opt_global.shortmess      = vim.opt_global.shortmess + 'W' -- don't echo "[w]"/"[written]" when writing
vim.opt_global.shortmess      = vim.opt_global.shortmess +
    'a' -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt_global.shortmess      = vim.opt_global.shortmess + 'c' -- completion messages
vim.opt_global.shortmess      = vim.opt_global.shortmess + 'o' -- overwrite file-written messages
vim.opt_global.shortmess      = vim.opt_global.shortmess + 't' -- truncate file messages at start
-- set report=0                               -- tell us when anything is changed via :...
vim.opt.fillchars             = { eob = '~', vert = "│", stl = ' ', stlnc = ' ' }
vim.opt_global.winminheight   = 0 -- The minimal height of a window, when its not the current window.
vim.opt.linebreak             = true -- wrap long lines at characters in 'breakat'
vim.opt_global.title          = false -- set terminal title
vim.opt_global.titlestring    = '%<%t' -- set titlestring to show filename only
vim.opt_global.titlelen       = 10
vim.opt_global.virtualedit    = 'block' -- allow cursor to move where there is no text in visual block mode
vim.opt.cursorline            = true -- color the current line
vim.opt_global.splitbelow     = true -- open horizontal splits below current window
vim.opt_global.splitright     = true -- open vertical splits to the right of the current window
vim.opt.signcolumn            = 'yes:2' -- always show 2 sign columns
vim.opt.showmode              = false -- remove last line mode
--vim.o.showtabline             = 2                      -- always enable tablines
vim.opt_global.termguicolors  = true

--= [ Visual Cues ]=--
vim.opt.showmatch             = true -- show matching brackets
vim.opt_global.matchtime      = 5 -- how many tenths of a second to blink matching brackets for
vim.opt_global.hlsearch       = true -- highlight searchs
vim.opt_global.incsearch      = true -- BUT do highlight as you type you search phrase
vim.opt.list                  = false -- show whitespace
vim.opt.listchars             = {
  tab = '▷┅',
  trail = '•',
  extends = '…',
  precedes = '…',
  eol = '↲',
  nbsp = '⦸'
} -- " what to show when I hit :set list

vim.opt_global.showbreak      = '↳  '
vim.opt_global.showcmd        = false -- don't show extra info at end of command line
vim.opt.breakindent           = true -- indent wrapped lines to match start
vim.opt.breakindentopt        = 'shift:2' -- emphasize broken lines by indenting them
vim.opt.scrolloff             = 3 -- Keep 10 lines (top/bottom) for scope
vim.opt.sidescrolloff         = 3 -- same as scrolloff, but for columns
vim.opt_global.visualbell     = false -- don't blink
vim.opt_global.errorbells     = false -- no noises
vim.opt_global.belloff        = 'all' -- shut up!
vim.opt_global.laststatus     = 3 -- always show the status line (is set with LuaLine plugin)
vim.opt.conceallevel          = 2
vim.opt.concealcursor         = ''
vim.opt_global.splitkeep      = 'cursor' -- scroll behavior when split a window
vim.opt_global.cmdheight      = 0 -- set command line height

--=[ Text Formatting/Layout ]=--
vim.opt.formatoptions         = 'crqnlMj' -- See Help (complex) TODO
vim.opt_global.joinspaces     = false -- don't autoinsert two spaces after '.', '?', '!' for join command
vim.opt.autoindent            = true -- autoindent
vim.opt.expandtab             = true -- tabs to spaces
vim.opt.smartindent           = true -- smartindent
vim.opt_global.shiftround     = true -- indent to the closest shiftwidth
vim.opt.cindent               = true -- do c-style indenting
vim.opt.tabstop               = 2 -- tab spacing (settings below are just to unify it)
vim.opt.shiftwidth            = 2 -- unify
vim.opt.softtabstop           = -1 -- use 'shiftwidth' for tab/bs at end of line
-- https://github.com/neovim/neovim/issues/12978
vim.opt.wrap                  = false -- do not wrap lines
vim.opt_global.smarttab       = true -- use tabs at the start of a line, spaces elsewhere
vim.opt_global.scrolljump     = 3 -- Jump 5 lines when running out of the screen
vim.opt.textwidth             = 200 -- Line with
vim.opt.spellcapcheck         = '' -- don't check for capital letters at start of sentence
vim.opt.spelloptions          = 'camel' -- setup spell to support camel case check

--=[ Folding ]=--
vim.opt.foldenable            = true -- Turn on folding
-- foldmethod is setup on lua/lsp.lua
-- vim.o.foldmethod  = indent                 -- Make folding indent sensitive
vim.opt.foldnestmax           = 10 --
vim.opt_global.foldlevelstart = 99 -- where start to fold a new buffer. 99 = unfolded
-- vim.o.foldtext               = nfx#utils#NeatFoldText()
vim.opt.foldlevel             = 1 -- Don't autofold anything (but I can still fold manually)
vim.opt_global.foldclose      = 'all' -- Autoclose folds, when moving out of them
vim.opt_global.inccommand     = 'split' -- incremental command live feedback

-- do not create default mappings for endwise
vim.g.endwise_no_mappings     = 1
-- vim.g.kommentary_create_default_mappings = false

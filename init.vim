"---[ Profiler ]---------------------------------------------------------- {{{
" let g:startup_profile_csv = "/tmp/profile_vim.csv"
" runtime macros/startup_profile.vim
"}}}

" let $NVIM_PYTHON_LOG_FILE='/tmp/nvim_python.log'
"
let mapleader = "\<space>"                                  " remap Leader
let maplocalleader = "\<BS>"                                " remap LocalLeader

" disable some plugins we do not use from startup
let g:loaded_2html_plugin      = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_zipPlugin         = 1
let g:loaded_tarPlugin         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_vimballPlugin     = 1

let $LOCAL_VIM_PATH=fnamemodify(expand("$MYVIMRC"), ":p:h")

" filetype plugin indent on                                   " Enable file type detection.
" syntax on

" % to bounce from do to end etc.
" runtime macros/matchit.vim

set guicursor=n-v-c:block,i-ci-ve:hor25-iCursor,r-cr:hor20,o:hor50
  \,a:Cursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" See `:h initialization` for initialization order
" See `:scriptnames` for a list of all scripts, in evaluation order.

" vim:foldmethod=marker:foldlevel=0:foldlevelstart=0:foldenable

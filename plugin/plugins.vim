if empty(glob('~/.config/nvim/pack/packager/opt/vim-packager'))
  silent !git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager
  au VimEnter * ++once PackagerInstall
  source ~/.config/nvim/init.vim
endif

function! PackagerInit() abort
  packadd vim-packager
  call packager#init()

  " Packager
  call packager#add('kristijanhusak/vim-packager',              {'type': 'opt'})
  call packager#add('preservim/nerdtree')                       ", { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  call packager#add('Xuyuanp/nerdtree-git-plugin')
  call packager#add('nvim-treesitter/nvim-treesitter')

  call packager#add('neovim/nvim-lspconfig')
  call packager#add('neovim/nvim-lsp')
  call packager#add('nvim-lua/completion-nvim')
  call packager#add('tjdevries/nlua.nvim')

  " call packager#add('junegunn/fzf',                             {'do': './install --all && ln -s $(pwd) ~/.fzf', 'type': 'opt'})
  call packager#add('junegunn/fzf',                             {'type': 'opt'})
  call packager#add('junegunn/fzf.vim',                         {'type': 'opt'})

  call packager#add('junegunn/vim-easy-align')

  " call packager#add('Shougo/deoplete.nvim',                     { 'do': ':UpdateRemotePlugins' })
  call packager#add('Shougo/neosnippet')
  call packager#add('Shougo/neosnippet-snippets')
  call packager#add('Shougo/context_filetype.vim')
  " call packager#add('Shougo/echodoc.vim',                       {'type': 'opt'})
  " call packager#add('tmsvg/pear-tree') " - autopairs
  call packager#add('jiangmiao/auto-pairs')


  " Plug 'vim-scripts/gitignore'

  call packager#add('vim-scripts/LargeFile')

  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-endwise')
  call packager#add('tpope/vim-rails',                            {'type': 'opt'})
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-characterize')
  call packager#add('tpope/vim-ragtag')

  call packager#add('airblade/vim-gitgutter') " mhinz/vim-signify
  call packager#add('Yggdroot/indentLine')

  call packager#add('wincent/loupe')
  call packager#add('wincent/vim-clipper')
  call packager#add('wincent/pinnacle')

  call packager#add('tomtom/tcomment_vim')
  " call packager#add('fatih/vim-go',                           {'type': 'opt'})
  call packager#add('w0rp/ale',                               {'type': 'opt'})
  call packager#add('rust-lang/rust.vim',                     {'type': 'opt'})

  " tpope/vim-jdaddy
  " /chaoren/vim-wordmotion
  " /junegunn/vim-peekaboo
  " /rhysd/committia.vim
  " /alok/notational-fzf-vim

  " Plug 'bogado/file-line'
  " Plug 'itchyny/lightline.vim'
  " Plug 'maximbaz/lightline-ale'
  " Plug 'ervandew/supertab'
  call packager#add('google/vim-searchindex')

  call packager#add('inkarkat/vim-ingo-library')
  " Plug 'inkarkat/vim-mark' "'dimasg/vim-mark'
  call packager#add('tmux-plugins/vim-tmux')
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('majutsushi/tagbar',                    {'type': 'opt'})
  call packager#add('kshenoy/vim-signature')
  call packager#add('moll/vim-bbye')
  call packager#add('mbbill/undotree')
  " Plug 'jremmen/vim-ripgrep'
  call packager#add('norcalli/nvim-colorizer.lua')
  call packager#add('t9md/vim-quickhl')
  call packager#add('kana/vim-operator-user') " required by vim-quickhl
  call packager#add('machakann/vim-vimhelplint',               {'type': 'opt'})
  call packager#add('tjdevries/manillua.nvim')
  call packager#add('nvim-lua/popup.nvim')
  call packager#add('nvim-lua/plenary.nvim')
  call packager#add('nvim-telescope/telescope.nvim')

  " sintaxs
  call packager#add('digitaltoad/vim-pug')
  call packager#add('elzr/vim-json')
  call packager#add('vim-ruby/vim-ruby')
  call packager#add('slim-template/vim-slim')
  call packager#add('othree/html5.vim')
  call packager#add('pangloss/vim-javascript')
  call packager#add('HerringtonDarkholme/yats.vim') " Plug 'leafgarland/typescript-vim'
  " Plug 'peitalin/vim-jsx-typescript'
  call packager#add('MaxMEllon/vim-jsx-pretty')
  call packager#add('Quramy/vim-js-pretty-template')
  call packager#add('RobertAudi/fish.vim')
  call packager#add('plasticboy/vim-markdown') " 'tpope/vim-markdown'
  call packager#add('dart-lang/dart-vim-plugin')
  call packager#add('hail2u/vim-css3-syntax')
  call packager#add('cakebaker/scss-syntax.vim')
  call packager#add('euclidianAce/BetterLua.vim')

  " themes
  call packager#add('tjdevries/colorbuddy.vim')
  call packager#add('tjdevries/gruvbuddy.nvim')
  call packager#add('gruvbox-community/gruvbox')
  call packager#add('vigoux/oak')
  " call packager#add('logico-dev/typewriter')
  " call packager#add('rakr/vim-one')
  " call packager#add('Rigellute/shades-of-purple.vim')
  " call packager#add('robertmeta/nofrils')
  " call packager#add('ayu-theme/ayu-vim')
  " call packager#add('cideM/yui')
  call packager#add('srcery-colors/srcery-vim')
  call packager#add('chriskempson/base16-vim')
  call packager#add('ayu-theme/ayu-vim')

  " --=[ to review ]=--
  " https://github.com/liuchengxu/vista.vim
  " https://github.com/nvim-lua/lsp-status.nvim

endfunction

command! PackagerInstall      call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean        call PackagerInit() | call packager#clean()
command! PackagerStatus       call PackagerInit() | call packager#status()


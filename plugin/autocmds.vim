
" let g:removeEndOfLineCharsOn = ['vim', 'ruby', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact']
let g:removeEndOfLineCharsOn = ['*.vim', '*.rb', '*.js', '*.ts', '*.jsx', '*.tsx', '*.rake', '*.fish', '*.lua']

augroup nfxprg
  autocmd!

  autocmd VimResized * execute "normal! \<c-w>="

  autocmd BufEnter * set cursorline
  autocmd BufLeave * set nocursorline

  " Jump to the last know position in a file if '" mark is set
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " autocmd BufRead * normal zz
  " remove empty lines on write, preserve cursor position
  execute "autocmd BufWritePre " . join(g:removeEndOfLineCharsOn, ',') . " call nfx#utils#preserve('%s/\\s\\+$//e')"
  " Disable paste mode on leaving insert mode.
  autocmd InsertLeave * set nopaste

  " but not for some types
  autocmd FileType tagbar,nerdtree setlocal signcolumn=no

  if exists('##TextYankPost')
    au TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 500, vim.v.event)
  end

  " if exists('+winhighlight')
  "   autocmd BufEnter,FocusGained,VimEnter,WinEnter * set winhighlight=
  "   autocmd FocusLost,WinLeave * set winhighlight= CursorLineNr:InactiveWindow,EndOfBuffer:InactiveWindow,IncSearch:ColorColumn,Normal:InactiveWindow,NormalNC:InactiveWindow,SignColumn:InactiveWindow
  " endif

  autocmd InsertLeave,VimEnter,WinEnter * if nfx#autocmds#should_cursorline() | setlocal cursorline | endif
  autocmd InsertEnter,WinLeave * if nfx#autocmds#should_cursorline() | setlocal nocursorline | endif

  autocmd BufNewFile,BufRead *.rb call nfx#prjconfig#lookup(expand('<afile>'), expand('<amatch>'))
  autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx call nfx#prjconfig#lookup(expand('<afile>'), expand('<amatch>'))
  autocmd BufNewFile,BufRead *.css,*.scss call nfx#prjconfig#lookup(expand('<afile>'), expand('<amatch>'))

augroup END

" augroup nfxWindowHandler
"   autocmd!
"   autocmd BufEnter,FocusGained,VimEnter,WinEnter * call nfx#window#activeHandler()
"   autocmd FocusLost,WinLeave * call nfx#window#inactiveHandler()
" augroup END

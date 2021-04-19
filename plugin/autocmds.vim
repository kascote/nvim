
augroup nfxprg
  autocmd!

  autocmd VimResized * execute "normal! \<c-w>="

  autocmd BufEnter,InsertLeave,VimEnter,WinEnter * setlocal cursorline
  autocmd BufLeave,InsertEnter,WinLeave * setlocal nocursorline

  " Jump to the last know position in a file if '" mark is set
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " autocmd BufRead * normal zz
  " Disable paste mode on leaving insert mode.
  autocmd InsertLeave * set nopaste

  autocmd FileType tagbar,nerdtree setlocal signcolumn=no

  " if exists('+winhighlight')
  "   autocmd BufEnter,FocusGained,VimEnter,WinEnter * set winhighlight=
  "   autocmd FocusLost,WinLeave * set winhighlight= CursorLineNr:InactiveWindow,EndOfBuffer:InactiveWindow,IncSearch:ColorColumn,Normal:InactiveWindow,NormalNC:InactiveWindow,SignColumn:InactiveWindow
  " endif

augroup END

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup ft_ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb syn match flagError "\<binding\.pry\>"
  autocmd BufNewFile,BufRead *.rb syn match flagError "\<byebug\>"
  autocmd BufNewFile,BufRead *.rb syn match flagError "\<debugger\>"
augroup END

augroup ft_javascriptreact
  autocmd!
  autocmd BufNewFile,BufRead *.rb syn matc flagError "console\."
augroup END

augroup ft_javascript
  autocmd!
  autocmd BufNewFile,BufRead *.rb syn match flagError "\<console\.\>"
augroup END

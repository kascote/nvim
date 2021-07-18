  function! s:setup_gitmessengerpopup() abort
      " For example, set go back/forward history to <C-o>/<C-i>
      nmap <buffer><C-p> o
      nmap <buffer><C-n> O
  endfunction
  autocmd FileType gitmessengerpopup call <SID>setup_gitmessengerpopup()

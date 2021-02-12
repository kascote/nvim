
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

function! FzfGem(name)
  let path = system("bundle info ".a:name." | rg -oP '(?<=Path: )(.+)$'")
  let path = substitute(path, '\n', '', '')
  execute ":ZFiles " . path
endfunction
command! -nargs=* FZFGem call FzfGem(<f-args>)

function! Gem(name)
  let path = system("bundle info ".a:name." | rg -oP '(?<=Path: )(.+)$'")
  let path = substitute(path, '\n', '', '')
  silent execute ":!tmux new-window -n 'gem:" . a:name . "' fish -l -c 'cd " . path . " && nvim -c \':FZF\''"
endfunction
command! -nargs=* Gem call Gem(<f-args>)


command! TrimWhitespace call nfx#utils#preserve('%s/\\s\\+$//e')

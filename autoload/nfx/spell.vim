function! nfx#spell#FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! nfx#spell#FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run(fzf#wrap({'source': suggestions, 'sink': function("nfx#spell#FzfSpellSink"), 'window': { 'width': 0.6, 'height': 0.3 }}))
endfunction

" Turn on spell-checking.
function! nfx#spell#spell()
  if has('syntax')
    setlocal spell
    setlocal spellfile=~/.config/nvim/spell/en.utf-8.add,~/.config/nvim/spell/espa.utf-8.add,~/.config/nvim/spell/tech.utf-8.add
    setlocal spelllang=en,es
  endif
endfunction

" Switch to plaintext mode with: call wincent#functions#plaintext()
function! nfx#spell#text()
  if has('conceal')
    let b:indentLine_ConcealOptionSet=1 " Don't let indentLine overwrite us.
    setlocal concealcursor=
  endif
  setlocal nolist
  setlocal textwidth=80
  setlocal wrap
  setlocal wrapmargin=0

  call nfx#spell#spell()

  " Break undo sequences into chunks (after punctuation); see: `:h i_CTRL-G_u`
  "
  " From:
  "
  "   https://twitter.com/vimgifs/status/913390282242232320
  "
  " Via:
  "
  "   https://github.com/ahmedelgabri/dotfiles/blob/f2b74f6cd4d/files/.vim/plugin/mappings.vim#L27-L33
  "
  inoremap <buffer> ! !<C-g>u
  inoremap <buffer> , ,<C-g>u
  inoremap <buffer> . .<C-g>u
  inoremap <buffer> : :<C-g>u
  inoremap <buffer> ; ;<C-g>u
  inoremap <buffer> ? ?<C-g>u

  nnoremap <buffer> j gj
  nnoremap <buffer> k gk

endfunction

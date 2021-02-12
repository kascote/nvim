" function! s:load_lsp() abort
"   packadd nvim-lsp
"   packadd completion-nvim
"
"   execute 'luafile ' . stdpath('config') . '/lua/lsp.lua'
" endfunction
"
" command! -nargs=0 LoadLsp call s:load_lsp()

execute 'luafile ' . stdpath('config') . '/lua/lsp.lua'

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Use <Tab> and <S-Tab> to navigate through popup menu
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ completion#trigger_completion()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

sign define LspDiagnosticsErrorSign text=✖ texthl=LspDiagnosticsError linehl= numhl=
sign define LspDiagnosticsWarningSign text=⚠ texthl=LspDiagnosticsWarning linehl= numhl=
sign define LspDiagnosticsInformationSign text=ℹ texthl=LspDiagnosticsInformation linehl= numhl=
sign define LspDiagnosticsHintSign text=❗ texthl=LspDiagnosticsHint linehl= numhl=

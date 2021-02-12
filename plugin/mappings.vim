"--=[ COMMAND ]=--------------------------------
" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %

"--=[ LEADER ]=--------------------------------
nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P

nnoremap <silent> <Leader>1 :set cursorline!<CR>
nnoremap <silent> <Leader>2 :set cursorcolumn!<CR>
nnoremap <silent> <Leader>4 :!bash
nnoremap <silent> <Leader>5 :set invpaste<CR>
nnoremap <silent> <Leader>7 :set invhlsearch<CR>
nnoremap <silent> <Leader>8 :set invlist<CR>
nnoremap <silent> <Leader>9 :call nfx#utils#cycle_numbering()<CR>
" Adjust indentation on the file
nnoremap <silent> <Leader>i :call nfx#utils#preserve("normal gg=G")<cr>
" Remove hightlights
nnoremap <silent> <Leader><cr> :noh<cr>
" Remove the Windows ^M
" nnoremap <silent> <Leader>0 mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
nnoremap <silent> <Leader>x :ZBuffers<CR>
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>r :NERDTreeFind<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
"toggle between last two buffers with comma-comma
nnoremap <silent> <Leader><Leader> :b#<cr>
"set current window proportions
nnoremap <silent> <Leader>h :exec "vertical resize " . ((&columns/4)*3)<CR>

nnoremap <Leader>a :ZRg <c-r><c-w>
" Close the current buffer
nnoremap <silent> <Leader>w :Bdelete<CR>
" normal mode mappings
" nmap <silent> <Leader><Tab> <Plug>(fzf-maps-n)
" " visual mode mappings
" xmap <silent> <Leader><Tab> <Plug>(fzf-maps-x)
" " insert mode mappings
" imap <silent> <Leader><Tab> <Plug>(fzf-maps-i)
" " operator-pending mappings
" omap <silent> <Leader><Tab> <Plug>(fzf-maps-o)

nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <Leader>gv <Plug>(GitGutterPreviewHunk)
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gf :GitGutterFold<cr>
nmap <Leader>gb :Gblame<CR>

nmap <Leader>m <Plug>(quickhl-manual-this)
xmap <Leader>m <Plug>(quickhl-manual-this)
nmap <Leader>M <Plug>(quickhl-manual-reset)
xmap <Leader>M <Plug>(quickhl-manual-reset)
nmap <Leader>n <Plug>(quickhl-manual-this-whole-word)
xmap <Leader>n <Plug>(quickhl-manual-this-whole-word)
nmap <Leader>j <Plug>(quickhl-cword-toggle)

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nnoremap <silent> <leader>af :ALEFix<cr>
nnoremap <silent> <leader>an :ALENext<cr>
nnoremap <silent> <leader>ap :ALEPrevious<cr>

" how customize virtual text
" https://gist.github.com/tjdevries/ccbe3b79bd918208f2fa8dfe15b95793
nnoremap <silent> <leader>ln :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> <leader>lp :lua vim.lsp.diagnostic.goto_prev()<cr>

"--=[ LOCAL-LEADER ]=--------------------------------
" give the syntax highlight id for the word under the cursor
nnoremap <LocalLeader>0 :echo synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
nnoremap <Localleader>9 :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nnoremap <Localleader>8 :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
" Fix (most) syntax highlighting problems in current buffer (mnemonic: coloring).
nnoremap <silent> <LocalLeader>c :syntax sync fromstart<CR>
nnoremap <LocalLeader>c :ZHistory:<cr>
nnoremap <LocalLeader>s :ZHistory/<cr>
nnoremap <silent> <LocalLeader>n :call fzf#vim#files('/vol/Dropbox/notes/')<cr>
nnoremap <LocalLeader>T :TrimWhitespace<cr>
nnoremap <LocalLeader>w set wildignore-=*/node_modules/*

"--=[ NORMAL ]=--------------------------------
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>
nnoremap <silent> <C-Up> :lprevious<CR>
nnoremap <silent> <C-Down> :lnext<CR>
nnoremap <silent> <C-Left> :lpfile<CR>
nnoremap <silent> <C-Right> :lnfile<CR>
" convenients remaps
nnoremap ' `
"nnoremap ¿ '
"nnoremap | %
" Toggle fold at current position.
nnoremap <Tab> za
" Avoid unintentional switches to Ex mode.
" nnoremap q <nop>
"--- move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'
" select the last changed/pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" Visually select the text that was last edited/pasted. From http://vimcasts.org/episodes/bubbling-text/
nnoremap gV `[v`]
" FZF fuzy search
nnoremap <C-p> :FZF<CR>

nnoremap z= :call nfx#spell#FzfSpell()<CR>

"--=[ INSERT ]=--------------------------------
" remap digraphs
inoremap <C-u> <C-k>
" Make Ctrl+J join lines in insert mode
inoremap <C-j> <C-o>J

inoremap <C-l> <C-R>=AutoPairsReturn()<cr>

imap <C-k> <Plug>(neosnippet_expand_or_jump)

"--=[ VISUAL ]=--------------------------------
"vmap <Leader>y "+y
" Visual mode mappings.
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l
vnoremap <silent> <Enter> :EasyAlign<cr>

xmap <C-k> <Plug>(neosnippet_expand_target)

"--=[ COMMAND ]=--------------------------------

" use C-j and C-k for search
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

"--=[ SELECT ]=--------------------------------

smap <C-k> <Plug>(neosnippet_expand_or_jump)


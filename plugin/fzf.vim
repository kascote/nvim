" FZF setup
let g:fzf_command_prefix = 'Z'

packadd fzf
packadd fzf.vim

" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--ansi --layout=reverse'

" Using the custom window creation function
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" disable preview window
let g:fzf_preview_window = ''

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 40% of the height
  let height = float2nr(&lines * 0.4)
  " 70% of the height
  let width = float2nr(&columns * 0.7)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
  " Set Floating Window Highlighting
  " call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
      \ buftype=nofile
      \ nobuflisted
      \ bufhidden=hide
      \ nonumber
      \ norelativenumber
      \ signcolumn=no
endfunction

" let g:fzf_colors = {
"   \ 'hl': ['fg', 'GruvboxOrange'],
"   \ 'hl+': ['fg', 'GruvboxOrange'],
"   \ 'pointer': ['fg', 'GruvboxRed'],
"   \ 'prompt': ['fg', 'GruvboxAqua'],
"   \ 'fg': ['fg', 'GruvboxFg3'],
"   \ 'fg+': ['fg', 'GruvboxFg1'],
"   \ 'bg+': ['bg', 'GruvboxBg3'],
" \ }

" let g:fzf_colors = {
"   \ 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
"


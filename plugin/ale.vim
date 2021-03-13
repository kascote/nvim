augroup ale_load_aucommands
  au!
  au FileType sh,zsh,bash,html,markdown,vim,lua,javascript,javascriptreact,typescript,typescriptreact,scss,css call s:load_ale()
augroup END

let s:ale_loaded = v:false
let g:ale_enabled = v:false

function! s:load_ale() abort
  let g:ale_enabled = v:true
  if s:ale_loaded
    return
  endif

  let s:ale_loaded = v:true

  packadd ale

  let g:ale_disable_lsp = 1
  let g:ale_sign_error='•'
  let g:ale_sign_warning='•'
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_on_enter = 1
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_linters = {
    \ 'markdown': ['alex', 'markdownlint', 'proselint', 'write-good', 'vale'],
    \ 'typescriptreact': ['eslint'],
    \}
  let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'javascriptreact': ['eslint'],
    \ 'typescriptreact': ['eslint'],
    \}
  let g:ale_warn_about_trailing_whitespace = 1
  let g:ale_set_highlights = 1
  let g:ale_max_signs = -1
  let g:ale_set_signs = 1
  let g:ale_set_balloons = 1
  let g:ale_sign_column_always = 1
  let g:ale_virtualtext_cursor = 1
  let g:ale_textlint_use_global = 1
  let g:ale_alex_use_global = v:true
  let g:ale_hover_to_preview = 1
  autocmd! ale_load_aucommands
  augroup! ale_load_aucommands
    ALEEnableBuffer
  augroup END
endfunction

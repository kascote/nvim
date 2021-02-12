
let s:projects={
  \ 'ntfx/scan': 'scan',
  \ 'eVisit/eVisit': 'evisit',
  \ 'wapopartners': 'wapo',
  \ 'WPMedia': 'wapo',
  \ }

function! nfx#prjconfig#detect(file) abort
  let l:rc = ''
  let l:git = nfx#git#get_git_dir(a:file)
  if l:git == ''
    return l:rc
  end

  let l:remotes = nfx#git#remotes(l:git)
  for l:key in keys(s:projects)
    let l:match = match(l:remotes, l:key)
    if l:match != -1
      let l:rc = s:projects[l:key]
      break
    endif
  endfor
  return l:rc
endfunction

function! nfx#prjconfig#lookup(file, type) abort
  let l:detect = nfx#prjconfig#detect(a:file)
  if l:detect == ''
    return
  endif

  if l:detect == 'evisit'
    let g:ale_linters = {
    \   'ruby': ['rubocop'],
    \}
    let g:ale_ruby_rubocop_options = '-c /vol/dev/evisit/lints/rubocop.yml'
    let g:ale_fixers = {}
    let g:ale_fix_on_save = 0
    let $SOLARGRAPH_PROJECT_CONFIG_PATH='/vol/dev/evisit/lints'
    let $RUBYOPT='-r/vol/dev/evisit/lints/solargraph_rails.rb'

    let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph', 'stdio'],
      \ }

  elseif l:detect == 'scan'
    let g:ale_linters = {
    \   'ruby': ['rubocop'],
    \}
    let g:ale_fixers = {
    \   'ruby': ['rubocop'],
    \}
    let g:ale_fix_on_save = 1

    let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph', 'stdio'],
      \ }

  elseif l:detect == 'wapo'
    let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'javascriptreact': ['eslint', 'stylelint'],
    \ 'scss': ['stylelint'],
    \}
    let g:ale_fixers = {
    \ 'javascriptreact': ['eslint', 'stylelint'],
    \ 'javascript': ['eslint'],
    \ 'scss': ['stylelint'],
    \}

  endif
endfunction

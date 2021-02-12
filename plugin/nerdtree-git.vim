
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'m',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'u',
                \ 'Renamed'   :'»',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'d',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'i',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

  highlight NERDTreeGitStatusUnmerged   guifg=#fe8019
  highlight NERDTreeGitStatusModified   guifg=#FFB454
  highlight NERDTreeGitStatusStaged     guifg=#8ec07c
  highlight NERDTreeGitStatusRenamed    guifg=#FFB454
  highlight NERDTreeGitStatusUnmerged   guifg=#fe8019
  highlight NERDTreeGitStatusUntracked  guifg=#83a598
  highlight NERDTreeGitStatusDirDirty   guifg=#fe8019
  highlight NERDTreeGitStatusDeleted    guifg=#fb4934
  highlight NERDTreeGitStatusIgnored    guifg=#666666
  highlight NERDTreeGitStatusDirClean   guifg=#8ec07c

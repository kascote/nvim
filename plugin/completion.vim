" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'Neosnippet'
let g:completion_chain_complete_list = {
  \  'js': [
  \    {'complete_items': ['ts', 'lsp', 'snippet']},
  \    {'mode': '<c-p>'},
  \    {'mode': '<c-n>'}
  \  ],
  \  'javascriptreact': [
  \    {'complete_items': ['ts', 'lsp', 'snippet']},
  \    {'complete_items': ['path']},
  \    {'mode': '<c-p>'},
  \    {'mode': '<c-n>'}
  \  ],
  \  'jsx': [
  \    {'complete_items': ['lsp', 'ts', 'snippet']},
  \    {'mode': '<c-p>'},
  \    {'mode': '<c-n>'}
  \  ],
  \  'default': [
  \    {'complete_items': ['lsp', 'snippet']},
  \    {'mode': '<c-p>'},
  \    {'mode': '<c-n>'}
  \  ]
\}


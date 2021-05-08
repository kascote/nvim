--  possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
vim.g.completion_enable_snippet = 'Neosnippet'
vim.g.completion_chain_complete_list = {
  javascript = {
    {complete_items= {'ts', 'lsp'}},
    {complete_items= {'snippet'}},
    {complete_items= {'path'}},
    {mode= '<c-p>'},
    {mode= '<c-n>'}
  };
  javascriptreact = {
    {complete_items= {'ts', 'lsp'}},
    {complete_items= {'snippet'}},
    {complete_items= {'path'}},
    {mode= '<c-p>'},
    {mode= '<c-n>'}
  },
  jsx = {
    {complete_items= {'lsp', 'ts'}},
    {complete_items= {'snippet'}},
    {mode = '<c-p>'},
    {mode = '<c-n>'}
  },
  default= {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'snippet'}},
    {mode = '<c-p>'},
    {mode = '<c-n>'}
  }
}

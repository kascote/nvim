local u = require('nfx.utils')

u.skm_sn('n', '<Up>',      ':cprevious<CR>')
u.skm_sn('n', '<Down>',    ':cnext<CR>')
u.skm_sn('n', '<Left>',    ':cpfile<CR>')
u.skm_sn('n', '<Right>',   ':cnfile<CR>')
u.skm_sn('n', '<C-Up>',    ':lprevious<CR>')
u.skm_sn('n', '<C-Down>',  ':lnext<CR>')
u.skm_sn('n', '<C-Left>',  ':lpfile<CR>')
u.skm_sn('n', '<C-Right>', ':lnfile<CR>')

u.skm_sn('n', "'",         "`") -- convenients remaps
u.skm_sn('n', '<Tab>',     'za') -- Toggle fold at current position.

-- move between windows
u.skm_sn('n', '<C-h>',     '<C-w>h')
u.skm_sn('n', '<C-j>',     '<C-w>j')
u.skm_sn('n', '<C-k>',     '<C-w>k')
u.skm_sn('n', '<C-l>',     '<C-w>l')

-- Store relative line number jumps in the jumplist if they exceed a threshold.
u.skm_sn('n', '<expr> k',  [[(v:count > 5 ? "m'" . v:count : '') . 'k']])
u.skm_sn('n', '<expr> j',  [[(v:count > 5 ? "m'" . v:count : '') . 'j']])
-- select the last changed/pasted text
u.skm_sn('n', '<expr> gp', "`[' . strpart(getregtype(), 0, 1) . '`]")
-- Visually select the text that was last edited/pasted. From http://vimcasts.org/episodes/bubbling-text/
u.skm_sn('n', 'gV',        '`[v`]')
u.skm_sn('n', '<C-p>',     '<cmd>lua R("nfx.plugins.telescope")["find_files"]()<CR>')
u.skm_sn('n', 'z=',        ':Telescope spell_suggest<cr>')

vim.cmd([[
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])

vim.api.nvim_set_keymap("n", "--", "<Plug>kommentary_line_default", {})
u.skm_sn('n', 'tt', '<cmd>lua R("nfx.alternate").alternate()<CR>')

--[[
        nnoremap <CR> :
--]]

------------------------------------------------------------------=[ INSERT ]=--
u.skm_sn('i', '<c-u>', '<C-k>') -- remap digraphs
u.skm_sn('i', '<c-m>', '<C-o>J') -- join lines in insert mode

u.skm_se('i', '<C-n>', 'compe#complete()')
-- u.skm_se('i', '<CR>', "compe#confirm('<CR>')")
u.skm_se('i', '<C-e>', "compe#close('<C-e>')")
u.skm_se('i', '<C-f>', "compe#scroll({ 'delta': +4 })")
u.skm_se('i', '<C-d>', "compe#scroll({ 'delta': -4 })")

vim.cmd([[
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]])

------------------------------------------------------------------=[ VISUAL ]=--
-- vmap <Leader>y "+y
-- Visual mode mappings.
u.skm_sn('x', '<C-h>',   '<C-w>h')
u.skm_sn('x', '<C-j>',   '<C-w>j')
u.skm_sn('x', '<C-k>',   '<C-w>k')
u.skm_sn('x', '<C-l>',   '<C-w>l')
u.skm_sn('v', '<Enter>', ':EasyAlign<cr>')

vim.cmd('xnoremap <C-k> <Plug>(neosnippet_expand_target)')

-----------------------------------------------------------------=[ COMMAND ]=--
-- Allow saving of files as sudo when I forgot to start vim using sudo.
u.skm_sn('c', 'w!!', 'w !sudo tee > /dev/null %')
-- use C-j and C-k for search
u.skm_n('c', '<c-j>', '<Down>')
u.skm_n('c', '<c-k>', '<Up>')

u.skm_sn('c', '%H', [[<C-R>=expand('%:h:p')<CR>]])
u.skm_sn('c', '%T', [[<C-R>=expand('%:t')<CR>]])
u.skm_sn('c', '%P', [[<C-R>=expand('%:p')<CR>]])
vim.api.nvim_set_keymap('c', '<c-r><c-r>', '<Plug>(TelescopeFuzzyCommandSearch)', { noremap = false, nowait = true })


------------------------------------------------------------------=[ LEADER ]=--
u.skm_sn('n', '<Leader>p',        '+p')
u.skm_sn('n', '<Leader>P',        '+P')

u.skm_sn('n', '<Leader>1',        ':set cursorline!<CR>')
u.skm_sn('n', '<Leader>2',        ':set cursorcolumn!<CR>')
u.skm_sn('n', '<Leader>4',        ':!bash')
u.skm_sn('n', '<Leader>5',        ':set invpaste<CR>')
u.skm_sn('n', '<Leader>7',        ':set invhlsearch<CR>')
u.skm_sn('n', '<Leader>8',        ':set invlist<CR>')
u.skm_sn('n', '<Leader>9',        ':lua require"nfx.utils".cycle_line_numbers()<CR>')
u.skm_sn('n', '<Leader>i',        ':lua require"nfx.utils".adjust_file_indent()<CR>')

-- Remove hightlights
u.skm_sn('n', '<Leader><cr>',     ':noh<cr>')

u.skm_sn('n', '<Leader>x',        '<cmd>lua R("nfx.plugins.telescope").buffers()<CR>')
u.skm_sn('n', '<Leader>a',        '<cmd>lua R("nfx.plugins.telescope").live_grep()<CR>')
u.skm_sn('n', '<Leader>tg',       '<cmd>lua R("nfx.plugins.telescope").git_files()<CR>')
u.skm_sn('n', '<Leader>ts',       '<cmd>lua R("nfx.plugins.telescope").git_status()<CR>')
u.skm_sn('n', '<Leader>th',       '<cmd>lua R("nfx.plugins.telescope").help_tags()<CR>')
u.skm_sn('n', '<Leader>td',       '<cmd>lua R("nfx.plugins.telescope").todo()<CR>')
u.skm_sn('n', '<Leader>tl',       '<cmd>lua R("nfx.plugins.telescope").grep_last_search()<CR>')

u.skm_sn('n', '<Leader>d',        ':NvimTreeToggle<CR>')
u.skm_sn('n', '<Leader>r',        ':NvimTreeFindFile<CR>')

u.skm_sn('n', '<Leader><Leader>', ':b#<cr>')

-- set current window proportions
u.skm_sn('n', '<Leader>h',        ':exec "vertical resize " . ((&columns/4)*3)<CR>')

u.skm_sn('n', '<Leader>w',        ':Bdelete<CR>')

u.skm_sn('n', '<Leader>gn',       '<cmd>lua require"gitsigns".next_hunk()<CR>')
u.skm_sn('n', '<Leader>gp',       '<cmd>lua require"gitsigns".prev_hunk()<CR>')
u.skm_sn('n', '<Leader>gv',       '<cmd>lua require"gitsigns".preview_hunk()<CR>')
u.skm_sn('n', '<Leader>ga',       '<cmd>lua require"gitsigns".stage_hunk()<CR>')
u.skm_sn('n', '<Leader>gu',       '<cmd>lua require"gitsigns".reset_hunk()<CR>')
u.skm_sn('n', '<Leader>gbl',      '<cmd>lua require"gitsigns".blame_line()<CR>')
u.skm_sn('n', '<Leader>gm',       ':GitMessenger<CR>')

vim.cmd('nmap <Leader>m <Plug>(quickhl-manual-this)')
vim.cmd('xmap <Leader>m <Plug>(quickhl-manual-this)')
vim.cmd('nmap <Leader>M <Plug>(quickhl-manual-reset)')
vim.cmd('xmap <Leader>M <Plug>(quickhl-manual-reset)')
vim.cmd('nmap <Leader>nt <Plug>(quickhl-cword-toggle)')

vim.cmd('nmap <Leader>nn <Plug>(quickhl-manual-goto-next')
vim.cmd('nmap <Leader>np <Plug>(quickhl-manual-goto-prev')

-- formatter
u.skm_sn('n', '<Leader>fp', '<cmd>lua require"nfx.formatter".prettier()<CR>')
u.skm_sn('n', '<Leader>fl', '<cmd>lua require"nfx.formatter".lua()<CR>')

------------------------------------------------------------=[ LOCAL-LEADER ]=--
-- give the syntax highlight id for the word under the cursor
u.skm_sn('n', '<LocalLeader>0', ':lua require("nfx.utils").syn_stack()<CR>')
-- Fix (most) syntax highlighting problems in current buffer (mnemonic: coloring).
u.skm_sn('n', '<LocalLeader>l', ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>')
u.skm_sn('n', '<LocalLeader>t', '<cmd>lua require("nfx.utils").trim_white_spaces()<CR>')
u.skm_sn('n', '<LocalLeader>nn', ':set wildignore-=*/node_modules/*')
u.skm_sn('n', '<LocalLeader>xx', '<cmd>TroubleToggle<cr>')
u.skm_sn('n', '<LocalLeader>xq', '<cmd>TroubleToggle quickfix<cr>')
u.skm_sn('n', '<LocalLeader>xl', '<cmd>TroubleToggle loclist<cr>')
u.skm_sn('n', '<LocalLeader>xr', '<cmd>TroubleToggle lsp_references<cr>')

u.skm_sn('n', '<LocalLeader>n', '<cmd>lua R("nfx.plugins.telescope").edit_neovim()<CR>')

u.skm_sn('n', '<LocalLeader>f0', '<cmd>lua vim.wo.foldlevel=0<CR>')
u.skm_sn('n', '<LocalLeader>f1', '<cmd>lua vim.wo.foldlevel=1<CR>')
u.skm_sn('n', '<LocalLeader>f2', '<cmd>lua vim.wo.foldlevel=2<CR>')
u.skm_sn('n', '<LocalLeader>f3', '<cmd>lua vim.wo.foldlevel=3<CR>')
u.skm_sn('n', '<LocalLeader>f4', '<cmd>lua vim.wo.foldlevel=4<CR>')
u.skm_sn('n', '<LocalLeader>f5', '<cmd>lua vim.wo.foldlevel=5<CR>')
u.skm_sn('n', '<LocalLeader>f6', '<cmd>lua vim.wo.foldlevel=6<CR>')
u.skm_sn('n', '<LocalLeader>f7', '<cmd>lua vim.wo.foldlevel=7<CR>')
u.skm_sn('n', '<LocalLeader>f8', '<cmd>lua vim.wo.foldlevel=8<CR>')
u.skm_sn('n', '<LocalLeader>f9', '<cmd>lua vim.wo.foldlevel=9<CR>')

u.skm_sn('n', '<LocalLeader>w',               ":WhichKey '<Space>'<CR>")

------------------------------------------------------------------=[ SELECT ]=--
vim.cmd('snoremap<C-k> <Plug>(neosnippet_expand_or_jump)')


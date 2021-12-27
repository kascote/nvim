local u = require('nfx.utils')

-- u.remap('n', '<Up>',      ':cprevious<CR>')
-- u.remap('n', '<Down>',    ':cnext<CR>')
-- u.remap('n', '<Left>',    ':cpfile<CR>')
-- u.remap('n', '<Right>',   ':cnfile<CR>')
-- u.remap('n', '<C-Up>',    ':lprevious<CR>')
-- u.remap('n', '<C-Down>',  ':lnext<CR>')
-- u.remap('n', '<C-Left>',  ':lpfile<CR>')
-- u.remap('n', '<C-Right>', ':lnfile<CR>')

u.remap('n', "'",         "`") -- convenients remaps
-- u.remap('n', '<Tab>',     'za') -- Toggle fold at current position.

-- move between windows
-- u.remap('n', '<C-h>',     '<C-w>h')
-- u.remap('n', '<C-j>',     '<C-w>j')
-- u.remap('n', '<C-k>',     '<C-w>k')
-- u.remap('n', '<C-l>',     '<C-w>l')

-- Visually select the text that was last edited/pasted. From http://vimcasts.org/episodes/bubbling-text/
-- u.remap('n', 'gV',        '`[v`]')
-- u.remap('n', '<C-p>',     '<cmd>lua R("nfx.plugins.telescope")["find_files"]()<CR>')
-- u.remap('n', 'z=',        ':Telescope spell_suggest<cr>')

vim.cmd([[
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])

-- u.remap("n", "--", "<Plug>kommentary_line_default", { noremap = false })
-- u.remap('n', 'tt', '<cmd>lua R("nfx.alternate").alternate()<CR>')

--[[
        nnoremap <CR> :
--]]

------------------------------------------------------------------=[ INSERT ]=--
-- u.remap('i', '<c-u>', '<C-k>') -- remap digraphs
-- u.remap('i', '<c-j>', '<C-o>J') -- join lines in insert mode

vim.cmd([[
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]])

------------------------------------------------------------------=[ VISUAL ]=--
-- vmap <Leader>y "+y
-- Visual mode mappings.
-- u.remap('v', '<Enter>', ':EasyAlign<cr>')

-----------------------------------------------------------------=[ COMMAND ]=--
-- Allow saving of files as sudo when I forgot to start vim using sudo.
u.remap('c', 'w!!', 'w !sudo tee > /dev/null %')
-- use C-j and C-k for search
u.remap('c', '<c-j>', '<Down>', { silent = false})
u.remap('c', '<c-k>', '<Up>', { silent = false})
u.remap('c', '<c-h>', '<Left>', { silent = false})
u.remap('c', '<c-l>', '<Right>', { silent = false})

u.remap('c', '%H', [[<C-R>=expand('%:h:p')<CR><space>]])
u.remap('c', '%T', [[<C-R>=expand('%:t')<CR>]])
u.remap('c', '%P', [[<C-R>=expand('%:p')<CR>]])
u.remap('c', '<c-r><c-r>', '<Plug>(TelescopeFuzzyCommandSearch)', { noremap = false, nowait = true })

------------------------------------------------------------------=[ LEADER ]=--
-- u.remap('n', '<Leader>p',        '+p')
-- u.remap('n', '<Leader>P',        '+P')

-- u.remap('n', '<Leader>1',        ':set cursorline!<CR>')
-- u.remap('n', '<Leader>2',        ':set cursorcolumn!<CR>')
-- u.remap('n', '<Leader>4',        ':!bash')
-- u.remap('n', '<Leader>5',        ':set invpaste<CR>')
-- u.remap('n', '<Leader>7',        ':set invhlsearch<CR>')
-- u.remap('n', '<Leader>8',        ':set invlist<CR>')
-- u.remap('n', '<Leader>9',        ':lua require"nfx.utils".cycle_line_numbers()<CR>')
-- u.remap('n', '<Leader>i',        ':lua require"nfx.utils".adjust_file_indent()<CR>')

-- Remove hightlights
-- u.remap('n', '<Leader><cr>',     ':noh<cr>')

-- u.remap('n', '<Leader>x',        '<cmd>lua R("nfx.plugins.telescope").buffers()<CR>')
-- u.remap('n', '<Leader>a',        '<cmd>lua R("nfx.plugins.telescope").live_grep()<CR>')
-- u.remap('n', '<Leader>tg',       '<cmd>lua R("nfx.plugins.telescope").git_files()<CR>')
-- u.remap('n', '<Leader>ts',       '<cmd>lua R("nfx.plugins.telescope").git_status()<CR>')
-- u.remap('n', '<Leader>th',       '<cmd>lua R("nfx.plugins.telescope").help_tags()<CR>')
-- u.remap('n', '<Leader>td',       '<cmd>lua R("nfx.plugins.telescope").todo()<CR>')
-- u.remap('n', '<Leader>tl',       '<cmd>lua R("nfx.plugins.telescope").grep_last_search()<CR>')

-- u.remap('n', '<Leader>d',        '<cmd>lua R("nfx.plugins.telescope").file_browser()<CR>')
-- u.remap('n', '<Leader>r',        '<cmd>lua R("nfx.plugins.telescope").file_browser_relative()<CR>')

-- u.remap('n', '<Leader><Leader>', ':b#<cr>')

-- set current window proportions
-- u.remap('n', '<Leader>h',        ':exec "vertical resize " . ((&columns/4)*3)<CR>')

-- u.remap('n', '<Leader>w',        ':Bdelete<CR>')

-- u.remap('n', '<Leader>gn',       '<cmd>lua require"gitsigns".next_hunk()<CR>')
-- u.remap('n', '<Leader>gp',       '<cmd>lua require"gitsigns".prev_hunk()<CR>')
-- u.remap('n', '<Leader>gv',       '<cmd>lua require"gitsigns".preview_hunk()<CR>')
-- u.remap('n', '<Leader>ga',       '<cmd>lua require"gitsigns".stage_hunk()<CR>')
-- u.remap('n', '<Leader>gu',       '<cmd>lua require"gitsigns".reset_hunk()<CR>')
-- u.remap('n', '<Leader>gbl',      '<cmd>lua require"gitsigns".blame_line()<CR>')
-- u.remap('n', '<Leader>gm',       ':GitMessenger<CR>')

-- vim.cmd('nmap <Leader>m <Plug>(quickhl-manual-this)')
-- vim.cmd('xmap <Leader>m <Plug>(quickhl-manual-this)')
-- vim.cmd('nmap <Leader>M <Plug>(quickhl-manual-reset)')
-- vim.cmd('xmap <Leader>M <Plug>(quickhl-manual-reset)')

-- formatter
-- u.remap('n', '<Leader>fp', '<cmd>lua require"nfx.formatter".prettier()<CR>')
-- u.remap('n', '<Leader>fl', '<cmd>lua require"nfx.formatter".lua()<CR>')

------------------------------------------------------------=[ LOCAL-LEADER ]=--
-- give the syntax highlight id for the word under the cursor
-- u.remap('n', '<LocalLeader>0', ':lua R("nfx.utils").syn_stack()<CR>', { silent = false, noremap = false})
-- Fix (most) syntax highlighting problems in current buffer (mnemonic: coloring).
-- u.remap('n', '<LocalLeader>l', ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>')
-- u.remap('n', '<LocalLeader>t', '<cmd>lua require("nfx.utils").trim_white_spaces()<CR>')
-- u.remap('n', '<LocalLeader>nn', ':set wildignore-=*/node_modules/*')
-- u.remap('n', '<LocalLeader>xx', '<cmd>TroubleToggle<cr>')
-- u.remap('n', '<LocalLeader>xq', '<cmd>TroubleToggle quickfix<cr>')
-- u.remap('n', '<LocalLeader>xl', '<cmd>TroubleToggle loclist<cr>')
-- u.remap('n', '<LocalLeader>xr', '<cmd>TroubleToggle lsp_references<cr>')

-- u.remap('n', '<LocalLeader>n', '<cmd>lua R("nfx.plugins.telescope").edit_neovim()<CR>')

-- u.remap('n', '<LocalLeader>f0', '<cmd>lua vim.wo.foldlevel=0<CR>')
-- u.remap('n', '<LocalLeader>f1', '<cmd>lua vim.wo.foldlevel=1<CR>')
-- u.remap('n', '<LocalLeader>f2', '<cmd>lua vim.wo.foldlevel=2<CR>')
-- u.remap('n', '<LocalLeader>f3', '<cmd>lua vim.wo.foldlevel=3<CR>')
-- u.remap('n', '<LocalLeader>f4', '<cmd>lua vim.wo.foldlevel=4<CR>')
-- u.remap('n', '<LocalLeader>f5', '<cmd>lua vim.wo.foldlevel=5<CR>')
-- u.remap('n', '<LocalLeader>f6', '<cmd>lua vim.wo.foldlevel=6<CR>')
-- u.remap('n', '<LocalLeader>f7', '<cmd>lua vim.wo.foldlevel=7<CR>')
-- u.remap('n', '<LocalLeader>f8', '<cmd>lua vim.wo.foldlevel=8<CR>')
-- u.remap('n', '<LocalLeader>f9', '<cmd>lua vim.wo.foldlevel=9<CR>')

------------------------------------------------------------------=[ SELECT ]=--


local wk = require "which-key"

-- unmap <Cmd>nohlsearch|diffupdate<CR><C-L>
vim.cmd [[nunmap <c-l>]]
-- unmap <C-G>u<C-U> -[[ remove to beggining of line]]
vim.cmd [[iunmap <c-u>]]

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
}

--[[ NORMAL MODE ]]
wk.register({
  ["<Up>"] = { "<cwd>cprevious<cr>", "Previous quick fix entry" },
  ["<Down>"] = { "<cwd>cnext<cr>", "Next quick fix entry" },
  ["<Left>"] = { "<cwd>cpfile<cr>", "Previous quick fix file entry" },
  ["<Right>"] = { "<cwd>cnfile<cr>", "Next quick fix file entry" },
  ["<C-Up>"] = { "<cwd>lprevious<cr>", "Previous list fix entry" },
  ["<C-Down>"] = { "<cwd>lnext<cr>", "Next list fix entry" },
  ["<C-Left>"] = { "<cwd>lpfile<cr>", "Previous list fix file entry" },
  ["<C-Right>"] = { "<cwd>lnfile<cr>", "Next list fix file entry" },
  ["<TAB>"] = { "za", "Toggle fold at current position" },
  ["<C-h>"] = { "<C-w>h", "Move to one pane left" },
  ["<C-j>"] = { "<C-w>j", "Move to one pane down" },
  ["<C-k>"] = { "<C-w>k", "Move to one pane up" },
  ["<C-l>"] = { "<C-w>l", "Move to one pane rigth" },
  ["gV"] = { "`[v`]", "Visually select the text that was last edited/pasted" },
  ["<C-p>"] = { '<cmd>lua R("nfx.plugins.telescope")["find_files"]()<cr>', "Open Telescope to select files" },
  ["z="] = { "<cmd>Telescope spell_suggest<cr>", "Suggest spell word under cursor" },
  t = {
    t = { '<cmd>lua R("nfx.alternate").alternate()<cr>', "Switch to alternate file" },
  },
}, {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

wk.register({
  ["--"] = { "<Plug>kommentary_line_default", "Change comments on current line" },
}, {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = false, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

-- ["<C-j>"] = { "<C-o>J", "Join lines in insert mode" },
-- [[ INSERT MODE ]]
wk.register({
  ["<C-u>"] = { "<C-k>", "Remap digraphs" },
  ["<C-j>"] = {
    function()
      _G.nfx.snip_jump_previous()
    end,
    "Jump to previous place on snippets",
  },
  ["<C-k>"] = {
    function()
      _G.nfx.snip_jump_next()
    end,
    "Expand or Jump Snipets",
  },
  ["<C-l>"] = {
    function()
      _G.nfx.snip_choice()
    end,
    "Snippet choice",
  },
}, {
  mode = "i", -- NORMAL mode
  -- prefix = "",
  -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  -- silent = true, -- use `silent` when creating keymaps
  -- noremap = true, -- use `noremap` when creating keymaps
  -- nowait = true, -- use `nowait` when creating keymaps
})

-- wk.register({
--   ["<C-k>"] = { function() _G.nfx.snip_jump_next() end, 'Expand or Jump Snipets'},
--   ["<C-j>"] = { function() _G.nfx.snip_jump_previous() end, "Join lines in insert mode" },
-- }, {
--   mode = "s",
--   silent = true, -- use `silent` when creating keymaps
-- })

--[[ VISUAL MODE ]]
wk.register({
  ["<Enter>"] = { "<cmd>EasyAlign<cr>", "Align plugin" },
  g = {
    y = { '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', "Github url to current range" },
  },
}, {
  mode = "v", -- VISUAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

--[[ LEADER ]]
wk.register({
  ["p"] = { "+p", "Paste Special" },
  ["P"] = { "+P", "Paste Special" },
  ["1"] = { "<cmd>set cursorline!<cr>", "Toggle cursor line" },
  ["2"] = { "<cmd>set cursorcolumn!<cr>", "Toggle column line" },
  ["8"] = { "<cmd>set invlist<cr>", "Toggle special chars" },
  ["9"] = { '<cmd>lua require"nfx.utils".cycle_line_numbers()<cr>', "Cycle between line numbers" },
  ["i"] = { '<cmd>lua require"nfx.utils".adjust_file_indent()<CR>', "Adjust indent lines" },
  ["<cr>"] = { "<cmd>noh<cr>", "Clear search hightlight" },
  ["x"] = { '<cmd>lua R("nfx.plugins.telescope").buffers()<cr>', "List buffers" },
  ["a"] = { '<cmd>lua R("nfx.plugins.telescope").live_grep()<cr>', "Live grep" },
  ["<leader>"] = { "<cmd>b#<cr>", "Switch to last used buffer" },
  h = {
    h = { '<cmd>exec "vertical resize " . ((&columns/4)*3)<CR>', "Resize current pane to 3/4" },
    a = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Harpoon mark file" },
    l = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', "Toggle Harpoon quick menu" },
    n = { '<cmd>lua require("harpoon.ui").nav_next()<CR>', "Next Harpoon mark" },
    p = { '<cmd>lua require("harpoon.ui").nav_prev()<CR>', "Previous Harpoon mark" },
  },
  ["w"] = { "<cmd>Bdelete<cr>", "Close current buffer without close pane" },
  s = {
    name = "Snippets",
    e = { "<cmd>e ~/.config/nvim/lua/nfx/plugins/snipets.lua<cr>", "Edit snippets" },
    r = { "<cmd>source ~/.config/nvim/lua/nfx/plugins/snipets.lua<cr>", "Reload snippets" },
  },
  t = {
    name = "Telescope",
    g = { '<cmd>lua R("nfx.plugins.telescope").git_files()<cr>', "Git files" },
    s = { '<cmd>lua R("nfx.plugins.telescope").git_status()<cr>', "Git files modified" },
    h = { '<cmd>lua R("nfx.plugins.telescope").help_tags()<cr>', "Help tags" },
    t = { '<cmd>lua R("nfx.plugins.telescope").todo()<cr>', "ToDo" },
    l = { '<cmd>lua R("nfx.plugins.telescope").grep_last_search()<cr>', "Last searches" },
    d = { '<cmd>lua R("nfx.plugins.telescope").file_browser()<cr>', "File Browser" },
    r = { '<cmd>lua R("nfx.plugins.telescope").file_browser_relative()<CR>', "File Browser relative to current file" },
  },
  f = {
    name = "Fold",
    -- f = { 'toggle fold', 'Toggle folds at level 0?'}, -- TODO: make function to handle toggle
    ["0"] = { "<cmd>lua vim.wo.foldlevel=0<cr>", "fold at level 0" },
    ["1"] = { "<cmd>lua vim.wo.foldlevel=1<cr>", "fold at level 1" },
    ["2"] = { "<cmd>lua vim.wo.foldlevel=2<cr>", "fold at level 2" },
    ["3"] = { "<cmd>lua vim.wo.foldlevel=3<cr>", "fold at level 3" },
    ["4"] = { "<cmd>lua vim.wo.foldlevel=4<cr>", "fold at level 4" },
    ["5"] = { "<cmd>lua vim.wo.foldlevel=5<cr>", "fold at level 5" },
    ["6"] = { "<cmd>lua vim.wo.foldlevel=6<cr>", "fold at level 6" },
    ["7"] = { "<cmd>lua vim.wo.foldlevel=7<cr>", "fold at level 7" },
    ["8"] = { "<cmd>lua vim.wo.foldlevel=8<cr>", "fold at level 8" },
    ["9"] = { "<cmd>lua vim.wo.foldlevel=9<cr>", "fold at level 9" },
  },
  g = {
    name = "Git",
    n = { '<cmd>lua require"gitsigns".next_hunk()<cr>', "Jump to next Hunk" },
    p = { '<cmd>lua require"gitsigns".prev_hunk()<cr>', "Jump to previous Hunk" },
    v = { '<cmd>lua require"gitsigns".preview_hunk()<cr>', "Preview Hunk" },
    a = { '<cmd>lua require"gitsigns".stage_hunk()<cr>', "Stage Hunk" },
    u = { '<cmd>lua require"gitsigns".reset_hunk()<cr>', "Reset Hunk" },
    bl = { '<cmd>lua require"gitsigns".blame_line()<cr>', "Blame Line" },
    m = { "<cmd>GitMessenger<cr>", "Toggle GitMessenger" },
    y = { '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', "Github url to current line" },
    Y = { '<cmd>lua require"gitlinker".get_repo_url()<cr>', "Github url to repository" },
  },
  m = { '<cmd>call quickhl#manual#this("n")<cr>', "Mark word under cursor" },
  M = { "<cmd>call quickhl#manual#reset()<cr>", "Clear all marks" },
}, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

--[[ LOCAL LEADER ]]
wk.register({
  ["0"] = { '<cmd>lua R("nfx.utils").syn_stack()<cr>', "Show color syntax stack" },
  -- l = { "<cmd>nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>", "Reset syntax" },
  t = { '<cmd>lua require("nfx.utils").trim_white_spaces()<cr>', "Trim white spaces on file" },
  ["nn"] = { "<cmd>set wildignore-=*/node_modules/*<cr>", "Remove node_modules from wildignore" },
  x = {
    name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "on QuickFix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "on LockList" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "on LspReference" },
    n = { '<cmd>lua R("nfx.plugins.telescope").edit_neovim()<cr>', "Edit Neovim files" },
  },
}, {
  mode = "n", -- NORMAL mode
  prefix = "<localleader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

local km = vim.keymap
km.set({ "c" }, "<c-j>", "<Down>", { silent = false })
km.set({ "c" }, "<c-k>", "<Up>", { silent = false })
km.set({ "c" }, "<c-h>", "<Left>", { silent = false })
km.set({ "c" }, "<c-l>", "<Right>", { silent = false })

km.set({ "c" }, "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

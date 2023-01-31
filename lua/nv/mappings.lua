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
  ["<TAB>"] = { "za", "Toggle fold at current position" },
  ["gV"] = { "`[v`]", "Visually select the text that was last edited/pasted" },
}, {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

wk.register({
  ["--"] = { "gcc", "Change comments on current line" },
}, {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = false, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

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
})

--[[ LEADER ]]
wk.register({
  ["1"] = { "<cmd>set cursorline!<cr>", "Toggle cursor line" },
  ["2"] = { "<cmd>set cursorcolumn!<cr>", "Toggle column line" },
  ["8"] = { "<cmd>set invlist<cr>", "Toggle special chars" },
  ["9"] = { '<cmd>lua require"nv.utils".cycle_line_numbers()<cr>', "Cycle between line numbers" },
  ["i"] = { '<cmd>lua require"nv.utils".adjust_file_indent()<CR>', "Adjust indent lines" },
  ["<cr>"] = { "<cmd>noh<cr>", "Clear search hightlight" },
  ["<leader>"] = { "<cmd>b#<cr>", "Switch to last used buffer" },
  h = {
    h = { '<cmd>exec "vertical resize " . ((&columns/4)*3)<CR>', "Resize current pane to 3/4" },
  },
  s = {
    name = "Snippets",
    e = { "<cmd>e ~/.config/nvim/lua/nv/plugins/snipets.lua<cr>", "Edit snippets" },
    r = { "<cmd>source ~/.config/nvim/lua/nv/plugins/snipets.lua<cr>", "Reload snippets" },
  },
  g = { name = "Git" },
  t = { name = "Telescope" },
  N = { "<cmd>messages<cr>", "Show messages" },
  f = {
    name = "Fold",
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
  p = {
    b = { '<cmd>lua R("nfx.custom_tele").tele_seiken({path="/apps/booking"})<cr>', "Booking App" },
    c = { '<cmd>lua R("nfx.custom_tele").tele_seiken({path="/packages/components-ui"})<cr>', "Components UI" },
    s = { '<cmd>lua R("nfx.custom_tele").tele_seiken({path="/packages/service-api"})<cr>', "Services API" },
    t = { '<cmd>lua R("nfx.custom_tele").tele_seiken({path="/packages/tsconfig"})<cr>', "TS config" },
    e = { '<cmd>lua R("nfx.custom_tele").tele_seiken({path="/packages/eslint-config-custom"})<cr>', "Eslint" },
  },
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
  ["0"] = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Show color syntax under cursor" },
  t = { '<cmd>lua require("lazy.util").float_term()<cr>', "Float Terminal" },
  ["nn"] = { "<cmd>set wildignore-=*/node_modules/*<cr>", "Remove node_modules from wildignore" },
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

" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/fernandezn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/fernandezn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/fernandezn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/fernandezn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/fernandezn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LargeFile = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/LargeFile"
  },
  LuaSnip = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.luasnip\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/dressing.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/fidget.nvim"
  },
  ["fzf.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/fzf.vim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\0\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nM\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  kommentary = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.comments\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  loupe = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/loupe"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.lualine\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["luv-vimdocs"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/luv-vimdocs"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22nfx.plugins.marks\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/marks.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n¸\1\0\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0\18\2\0\0009\0\5\0'\3\6\0006\4\0\0'\6\a\0B\4\2\0029\4\b\4B\4\1\0A\0\2\1K\0\1\0\20on_confirm_done\"nvim-autopairs.completion.cmp\17confirm_done\aon\nevent\bcmp\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp_luasnip", "cmp-path", "cmp-nvim-lsp", "cmp-nvim-lua" },
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20nfx.plugins.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-luaref"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-luaref"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-refactor", "nvim-ts-context-commentstring", "nvim-ts-autotag", "playground" },
    only_config = true
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17package-info\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/package-info.nvim"
  },
  playground = {
    load_after = {},
    loaded = false,
    needs_bufread = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-npm.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/telescope-npm.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22nfx.plugins.theme\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tmode\26workspace_diagnostics\nicons\1\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-bbye"
  },
  ["vim-characterize"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-characterize"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fish-syntax"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-fish-syntax"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.markdown\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-quickhl"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-quickhl"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vimhelplint"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/vim-vimhelplint"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

-- Config for: harpoon
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fharpoon\frequire\0", "config", "harpoon")
-- Config for: vim-markdown
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.markdown\frequire\0", "config", "vim-markdown")
-- Config for: kommentary
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.comments\frequire\0", "config", "kommentary")
-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.lualine\frequire\0", "config", "lualine.nvim")
-- Config for: fidget.nvim
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
-- Config for: trouble.nvim
try_loadstring("\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tmode\26workspace_diagnostics\nicons\1\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
-- Config for: dressing.nvim
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: nvim-notify
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
-- Config for: LuaSnip
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.luasnip\frequire\0", "config", "LuaSnip")
-- Config for: todo-comments.nvim
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
-- Config for: gitlinker.nvim
try_loadstring("\27LJ\2\n>\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\0\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
-- Config for: tokyonight.nvim
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22nfx.plugins.theme\frequire\0", "config", "tokyonight.nvim")
-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27nfx.plugins.completion\frequire\0", "config", "nvim-cmp")
-- Config for: package-info.nvim
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17package-info\frequire\0", "config", "package-info.nvim")
-- Config for: lspkind-nvim
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\nM\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: marks.nvim
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22nfx.plugins.marks\frequire\0", "config", "marks.nvim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!nfx.plugins.treesitter_setup\frequire\0", "config", "nvim-treesitter")
-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n¸\1\0\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0\18\2\0\0009\0\5\0'\3\6\0006\4\0\0'\6\a\0B\4\2\0029\4\b\4B\4\1\0A\0\2\1K\0\1\0\20on_confirm_done\"nvim-autopairs.completion.cmp\17confirm_done\aon\nevent\bcmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
-- Load plugins in order defined by `after`
vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd nvim-ts-autotag ]]
vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

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
  LargeFile = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/LargeFile"
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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nM\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
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
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.lspsaga\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.lualine\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27nfx.plugins.completion\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-compe"
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
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  playground = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tagbar = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/tagbar"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
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
  ["vim-endwise"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-endwise"
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
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-signature"
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
  ["vim-tmux"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vimhelplint"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/vim-vimhelplint"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-which-key"
  }
}

-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.nvimtree\frequire\0", "config", "nvim-tree.lua")
-- Config for: vim-markdown
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.markdown\frequire\0", "config", "vim-markdown")
-- Config for: todo-comments.nvim
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.lualine\frequire\0", "config", "lualine.nvim")
-- Config for: tokyonight.nvim
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22nfx.plugins.theme\frequire\0", "config", "tokyonight.nvim")
-- Config for: lspsaga.nvim
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24nfx.plugins.lspsaga\frequire\0", "config", "lspsaga.nvim")
-- Config for: kommentary
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nfx.plugins.comments\frequire\0", "config", "kommentary")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\nM\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27nfx.plugins.completion\frequire\0", "config", "nvim-compe")
-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

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

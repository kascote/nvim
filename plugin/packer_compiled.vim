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
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["fzf.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  loupe = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/loupe"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lsp"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-lsp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
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
  oak = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/oak"
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
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/telescope.nvim"
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
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-farin"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-farin"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-github-colorscheme"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-github-colorscheme"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-quickhl"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-quickhl"
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-ragtag"
  },
  ["vim-rails"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/opt/vim-rails"
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
    loaded = true,
    path = "/Users/fernandezn/.local/share/nvim/site/pack/packer/start/vim-startuptime"
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

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

local fn = vim.fn

local vim_cache = fn.stdpath('config')
local install_path = vim_cache .. "/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [=[packadd packer.nvim]=]
vim.cmd [=[augroup nfxPlugins]=]
vim.cmd [=[  au!]=]
vim.cmd [=[  autocmd BufWritePost plugins.lua PackerCompile]=]
vim.cmd [=[augroup END]=]

local packer = require('packer')
packer.startup(function(use)

  -- use {'preservim/nerdtree', cmd = {'NERDTreeToggle', 'NERDTreeFind'}}
  -- use {'Xuyuanp/nerdtree-git-plugin'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-treesitter/completion-treesitter'}
  use {'nvim-treesitter/playground'}

  use {'neovim/nvim-lspconfig'}
  use {'neovim/nvim-lsp'}
  use {'nvim-lua/completion-nvim'}
  use {'tjdevries/nlua.nvim'}
  use {'windwp/nvim-ts-autotag'}
  use {'glepnir/lspsaga.nvim'}

  use {'fatih/vim-go'}
  -- use {'tjdevries/express_line.nvim'}
  use {'~/pvt/dev/express_line.nvim'}
  use {'junegunn/vim-easy-align'}

  use {'Shougo/neosnippet.vim'}
  use {'Shougo/neosnippet-snippets'}

  use {'vim-scripts/LargeFile'}

  use {'tpope/vim-commentary'}
  use {'tpope/vim-endwise'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-characterize'}
  use {'tpope/vim-ragtag'}

  use {'airblade/vim-gitgutter'}
  use {'wincent/loupe'}
  use {'t9md/vim-quickhl'}

  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'html', 'markdown', 'vim', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'lua'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }
  use {'tmux-plugins/vim-tmux'}
  use {'christoomey/vim-tmux-navigator'}
  use {'kshenoy/vim-signature'}
  use {'moll/vim-bbye'}
  use {'mbbill/undotree'}

  use { 'norcalli/nvim-colorizer.lua'}
  -- use {'t9md/vim-quickhl'}
  -- use {'kana/vim-operator-user'} -- required by vim-quickhl
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}

  use {'junegunn/fzf.vim',          opt = true}
  use {'tpope/vim-rails',           opt = true}
  use {'majutsushi/tagbar',         opt = true}
  use {'machakann/vim-vimhelplint', opt = true}
  use {'dstein64/vim-startuptime'}

  --=[ Syntax ]=--
  use {'plasticboy/vim-markdown'} -- tpope/vim-markdown

  --=[ Themes ]=--
  use {'tjdevries/colorbuddy.vim'}
  -- use {'tjdevries/gruvbuddy.nvim'}
  -- use {'gruvbox-community/gruvbox'}
  use {'vigoux/oak'}
  use {'mlopes/vim-farin'}
  use {'endel/vim-github-colorscheme'}

  --[[ to review

    rhysd/git-messenger.vim
    nvim-lua/lsp-status.nvim
    tpope/vim-jdaddy
    chaoren/vim-wordmotion
    junegunn/vim-peekaboo
    rhysd/committia.vim
    alok/notational-fzf-vim
    lewis6991/gitsigns.nvim
    charlesmallah/lua-profiler
    lewis6991/spellsitter.nvim
    TimUntersberger/neogit

    https://github.com/liuchengxu/vim-which-key
    https://github.com/vitalk/vim-simple-todo

  --]]

end)


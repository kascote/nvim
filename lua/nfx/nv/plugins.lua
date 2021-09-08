local fn = vim.fn

local vim_cache = fn.stdpath "config"
local install_path = vim_cache .. "/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [=[packadd packer.nvim]=]
vim.cmd [=[augroup nfxPlugins]=]
vim.cmd [=[  au!]=]
vim.cmd [=[  autocmd BufWritePost plugins.lua PackerCompile]=]
vim.cmd [=[augroup END]=]

local packer = require "packer"
packer.startup(function(use)
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }

  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "nfx.plugins.nvimtree"
    end,
  }
  use { "nvim-treesitter/nvim-treesitter" }
  use { "nvim-treesitter/playground" }

  use {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    requires = {
      "jose-elias-alvarez/null-ls.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
    wants = {
      "null-ls.nvim",
      "nvim-lsp-ts-utils",
    },
    config = function()
      require "nfx.plugins.lsp"
    end,
  }
  use {
    "hrsh7th/nvim-compe",
    config = function()
      require "nfx.plugins.completion"
    end,
  }
  use { "tjdevries/nlua.nvim" }
  use { "windwp/nvim-ts-autotag" }
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require "nfx.plugins.lspsaga"
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }
  use { "hrsh7th/vim-vsnip" }
  use { "hrsh7th/vim-vsnip-integ" }
  use { "ray-x/lsp_signature.nvim" }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }
  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require "nfx.plugins.lualine"
    end,
  }

  -- use {'fatih/vim-go'}
  -- use { "~/pvt/dev/express_line.nvim" }
  use { "junegunn/vim-easy-align" }

  use { "vim-scripts/LargeFile" }

  use { "tpope/vim-endwise" }
  use { "tpope/vim-repeat" }
  use { "tpope/vim-surround" }
  use { "tpope/vim-characterize" }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        keymaps = {}, -- disable default keymaps
      }
    end,
  }
  use { "wincent/loupe" }
  use { "t9md/vim-quickhl" }
  use { "tyru/open-browser.vim" }

  use { "christoomey/vim-tmux-navigator" }
  use { "kshenoy/vim-signature" }
  use { "moll/vim-bbye" }
  use { "mbbill/undotree" }
  use { "liuchengxu/vim-which-key" }

  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use { "junegunn/fzf.vim", opt = true }
  -- use { "tpope/vim-rails", opt = true }
  use { "majutsushi/tagbar", opt = true }
  use { "machakann/vim-vimhelplint", opt = true }
  use { "dstein64/vim-startuptime", opt = true }
  use {
    "rhysd/git-messenger.vim",
    opt = true,
    cmd = "GitMessenger",
  }
  use {
    "b3nj5m1n/kommentary",
    -- opt = true,
    -- keys = { "gc", "gcc", "--" },
    config = function()
      require "nfx.plugins.comments"
    end,
  }

  --=[ Syntax ]=--
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }
  use {
    "plasticboy/vim-markdown",
    config = function()
      require "nfx.plugins.markdown"
    end,
  } -- tpope/vim-markdown

  use { "tmux-plugins/vim-tmux" }

  --=[ Themes ]=--
  -- use { "tjdevries/colorbuddy.vim" }
  -- use {'tjdevries/gruvbuddy.nvim'}
  -- use {'gruvbox-community/gruvbox'}
  -- use { "vigoux/oak" }
  use {
    "folke/tokyonight.nvim",
    config = function()
      require "nfx.plugins.theme"
    end,
  }
  -- use {'mlopes/vim-farin'}
  -- use {'endel/vim-github-colorscheme'}
  -- use {'lewis6991/github_dark.nvim'}

  --[[ to review

    chaoren/vim-wordmotion
    alok/notational-fzf-vim
    charlesmallah/lua-profiler
    lewis6991/spellsitter.nvim
    windwp/nvim-spectre

    https://github.com/vitalk/vim-simple-todo
    https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    https://github.com/akinsho/flutter-tools.nvim
    https://github.com/jose-elias-alvarez/null-ls.nvim
    https://github.com/lukas-reineke/indent-blankline.nvim
    https://github.com/L3MON4D3/LuaSnip
    https://github.com/windwp/lsp-fastaction.nvim
    https://github.com/mhartington/formatter.nvim
    https://github.com/vhyrro/neorg
    https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
    https://github.com/lukas-reineke/indent-blankline.nvim
    https://github.com/ray-x/navigator.lua
    https://github.com/JoosepAlviste/nvim-ts-context-commentstring

  --]]
end)

local fn = vim.fn

local vim_cache = fn.stdpath "config"
local install_path = vim_cache .. "/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [[
  packadd packer.nvim
  augroup nfxPlugins
    au!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local packer = require "packer"
packer.startup(function(use)
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  -- https://github.com/neovim/neovim/issues/12587
  use {
    "antoinemadec/FixCursorHold.nvim",
    run = function()
      vim.g.curshold_updatime = 1000
    end,
  }

  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "nfx.plugins.treesitter_setup"
      end,
    },
    { "nvim-treesitter/playground", after = "nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
  }

  use {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require "nfx.plugins.lsp"
    end,
  }

  use { "jose-elias-alvarez/nvim-lsp-ts-utils" }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  }

  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require "nfx.plugins.luasnip"
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "nfx.plugins.completion"
    end,
  }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }
  use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }

  use {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require "notify"
    end,
  }

  use {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup {
        mappings = nil,
      }
    end,
  }
  use {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()
    end,
  }
  use { "tjdevries/nlua.nvim" }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
      -- Integration w/ nvim-cmp
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  }
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
  use {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init {}
    end,
  }
  use { "nanotee/luv-vimdocs" }
  use { "milisims/nvim-luaref" }

  use {
    "chentau/marks.nvim",
    config = function()
      require "nfx.plugins.marks"
    end,
  }
  use { "moll/vim-bbye" }
  use { "mbbill/undotree" }
  use { "folke/which-key.nvim" }
  use {
    "folke/trouble.nvim",
    -- requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        icons = false,
        mode = "workspace_diagnostics",
      }
    end,
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "elianiva/telescope-npm.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use { "junegunn/fzf.vim", opt = true }
  -- use { "tpope/vim-rails", opt = true }
  use { "machakann/vim-vimhelplint", opt = true }
  use { "dstein64/vim-startuptime", opt = true }
  use {
    "rhysd/git-messenger.vim",
    opt = true,
    cmd = "GitMessenger",
  }

  use {
    "b3nj5m1n/kommentary",
    config = function()
      require "nfx.plugins.comments"
    end,
  }

  use {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = function()
      require("package-info").setup {}
    end,
  }

  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {}
    end
  }

  use { 'khaveesh/vim-fish-syntax' }

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

  --=[ Themes ]=--
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

    https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    https://github.com/akinsho/flutter-tools.nvim
    https://github.com/lukas-reineke/indent-blankline.nvim
    https://github.com/vhyrro/neorg
    https://github.com/ray-x/navigator.lua
    https://github.com/numToStr/Comment.nvim
    https://github.com/AckslD/nvim-neoclip.lua
    https://github.com/folke/zen-mode.nvim

    https://github.com/captainko/ckovim/blob/70d09e50320de74fb3f9b9314e2e9cf70d570f86/lua/cko/plugins/cmp.lua

    html cssls jsonls LSPs

    set foldmethod=expr
    foldexpr=nvim_treesitter#foldexpr()

  --]]
end)

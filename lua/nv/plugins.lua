local fn = vim.fn
local localPackages = fn.stdpath "config"
_G.is_bootstrap = false
local vim_cache = fn.stdpath "data" -- ~/.local/share/nvim
local install_path = vim_cache .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  _G.is_bootstrap = true
  vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  --=[ local ]=--
  use {
    localPackages .. "/lua/vnav",
    config = function()
      require "vnav"
    end,
  }

  use { "nvim-lua/plenary.nvim" }
  use { "dstein64/vim-startuptime", opt = true }
  use { "junegunn/vim-easy-align" }
  use { "vim-scripts/LargeFile" }
  use { "tpope/vim-repeat" }
  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  }
  use { "tpope/vim-characterize" }
  --[[ use { "wincent/loupe" } ]]
  --[[ use { "t9md/vim-quickhl" } ]]
  use { "moll/vim-bbye" }
  use { "mbbill/undotree" }
  -- use { "junegunn/fzf.vim", opt = true }

  --[[ use { "nanotee/luv-vimdocs" } ]]
  --[[ use { "milisims/nvim-luaref" } ]]
  -- use { "machakann/vim-vimhelplint", opt = true }
  use "b0o/schemastore.nvim"

  --=[ Treesitter ]=--
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        pcall(require("nvim-treesitter.install").update { with_sync = true })
      end,
      config = function()
        require "nv.plugins.treesitter_setup"
      end,
    },
    { "nvim-treesitter/playground", after = "nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
    { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  }

  --=[ Lsp ]=--
  use {
    {
      "neovim/nvim-lspconfig",
      event = "BufReadPre",
    },
    {
      "folke/neodev.nvim",
      after = "nvim-lspconfig",
      config = function()
        require "nv.plugins.lsp"
      end,
    },
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  }

  use { "jose-elias-alvarez/typescript.nvim" }

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
      require "nv.plugins.markdown"
    end,
  }

  use { "khaveesh/vim-fish-syntax" }

  --=[ Themes ]=--
  -- use {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     require "nv.plugins.theme"
  --   end,
  -- }

  -- use {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   --[[ run = ":CatppuccinCompile", ]]
  --   config = function()
  --     require("catppuccin").setup {
  --       integrations = {
  --         lsp_trouble = true,
  --         which_key = true,
  --         navic = true,
  --         telescope = true,
  --         notify = true,
  --         cmp = true,
  --         markdown = true,
  --         gitsigns = true,
  --         treesitter = true,
  --         telekasten = false,
  --         beacon = false,
  --         bufferline = false,
  --         dashboard = false,
  --         nvimtree = { enabled = false },
  --       },
  --       compile = {
  --         enabled = false,
  --         path = vim.fn.stdpath "cache" .. "/catppuccin",
  --       },
  --       color_overrides = {
  --         mocha = {
  --           base = "#07070a",
  --         },
  --       },
  --       dim_inactive = {
  --         enabled = true,
  --         shade = "dark",
  --         percentage = 0.05,
  --       },
  --     }
  --   end,
  -- }

  --=[ UI ]=--
  use {
    "stevearc/dressing.nvim",
    config = function()
      require "nv.plugins.dressing"
    end,
  }

  use {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require "notify"
    end,
  }

  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require "nv.plugins.lualine"
    end,
  }

  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require "nv.plugins.gps"
    end,
  }

  use { "folke/which-key.nvim" }

  use { "ray-x/lsp_signature.nvim" }

  --[[ use { ]]
  --[[   "folke/noice.nvim", ]]
  --[[   event = "VimEnter", ]]
  --[[   config = function() ]]
  --[[     require("noice").setup() ]]
  --[[   end, ]]
  --[[   requires = { ]]
  --[[     "MunifTanjim/nui.nvim", ]]
  --[[     "rcarriga/nvim-notify", ]]
  --[[   }, ]]
  --[[ } ]]

  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require "nv.plugins.luasnip"
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "nv.plugins.completion"
    end,
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
    use { "hrsh7th/cmp-path", after = "nvim-cmp" },
    use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
    use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    use {
      "onsails/lspkind.nvim",
      before = "nvim-cmp",
      config = function()
        require("lspkind").init {}
      end,
    },
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
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        keymaps = {}, -- disable default keymaps
      }
    end,
  }

  use {
    "rhysd/git-messenger.vim",
    opt = true,
    cmd = "GitMessenger",
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
      -- Integration w/ nvim-cmp
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }

  use {
    "chentoast/marks.nvim",
    config = function()
      require "nv.plugins.marks"
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require "nv.plugins.comments"
    end,
    after = { "nvim-ts-context-commentstring" },
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = function()
      require("toggleterm").setup()
    end,
  }

  use {
    "lmburns/lf.nvim",
    config = function()
      -- This feature will not work if the plugin is lazy-loaded
      -- vim.g.lf_netrw = 1

      require("lf").setup {
        escape_quit = false,
        border = "rounded",
        focus_on_open = false,
        -- highlights = {FloatBorder = {guifg = require("kimbox.palette").colors.magenta}}
      }

      -- vim.keymap.set("n", "<C-o>", ":Lf<CR>")
    end,
    requires = { "plenary.nvim", "toggleterm.nvim" },
  }

  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
      require "nv.plugins.neorg"
    end,
    requires = "nvim-lua/plenary.nvim",
    after = "nvim-treesitter",
  }

  --[[ to review

    https://github.com/folke/lazy.nvim
    https://github.com/phaazon/mind.nvim
    https://github.com/akinsho/flutter-tools.nvim
    https://github.com/rhysd/conflict-marker.vim
    https://github.com/sindrets/diffview.nvim
    https://github.com/kevinhwang91/nvim-bqf
    https://github.com/nvchad/nvim-colorizer.lua
    https://github.com/MunifTanjim/exrc.nvim
    https://github.com/folke/noice.nvim
    https://github.com/theHamsta/nvim-semantic-tokens
    https://github.com/rafamadriz/friendly-snippets/

    chaoren/vim-wordmotion
    alok/notational-fzf-vim
    charlesmallah/lua-profiler
    windwp/nvim-spectre

    https://github.com/tamago324/nlsp-settings.nvim
    https://github.com/lukas-reineke/indent-blankline.nvim
    https://github.com/ray-x/navigator.lua
    https://github.com/AckslD/nvim-neoclip.lua
    https://github.com/folke/zen-mode.nvim

    https://github.com/ziontee113/syntax-tree-surfer

    https://github.com/UserNobody14/tree-sitter-dart

    https://github.com/captainko/ckovim/blob/70d09e50320de74fb3f9b9314e2e9cf70d570f86/lua/cko/plugins/cmp.lua

    https://vale.sh/
    https://bhupesh.me/writing-like-a-pro-with-vale-and-neovim/


    -- add an event vim-bbye when close the buffer, 
    -- nice to update the tabbar when close the buffer
    https://github.com/romgrk/barbar.nvim/pull/21/files

  --]]

  if _G.is_bootstrap then
    require("packer").sync()
  end
end)

if _G.is_bootstrap then
  print "=================================="
  print "    Plugins are being installed"
  print "    Wait until Packer completes,"
  print "       then restart nvim"
  print "=================================="
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
  group = packer_group,
  pattern = localPackages .. "/lua/nv/plugins.lua",
  -- pattern = vim.fn.expand "$MYVIMRC",
})

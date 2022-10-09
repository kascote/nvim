local fn = vim.fn
local localPackages = "~/.config/nvim"

local vim_cache = fn.stdpath "data" -- ~/.local/share/nvim
local install_path = vim_cache .. "/site/pack/packer/opt/packer.nvim"

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
  use { "wbthomason/packer.nvim", opt = true }

  --=[ local ]=--
  use {
    localPackages .. "/lua/vnav",
    config = function()
      require "vnav"
    end,
  }

  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "dstein64/vim-startuptime", opt = true }
  use { "junegunn/vim-easy-align" }
  use { "vim-scripts/LargeFile" }
  -- use { "tpope/vim-endwise" }
  use { "tpope/vim-repeat" }
  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  } -- use { "tpope/vim-surround" }
  use { "tpope/vim-characterize" }
  use { "wincent/loupe" }
  -- use { "t9md/vim-quickhl" }
  use { "moll/vim-bbye" }
  use { "mbbill/undotree" }
  -- use { "junegunn/fzf.vim", opt = true }

  use { "nanotee/luv-vimdocs" }
  use { "milisims/nvim-luaref" }
  -- use { "machakann/vim-vimhelplint", opt = true }
  use "b0o/schemastore.nvim"

  --=[ Treesitter ]=--
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "nv.plugins.treesitter_setup"
      end,
    },
    { "nvim-treesitter/playground", after = "nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
    { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
  }

  use { "RRethy/nvim-treesitter-endwise" }

  --=[ Lsp ]=--
  use "folke/lua-dev.nvim"

  use {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require "nv.plugins.lsp"
    end,
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
  } -- tpope/vim-markdown

  use { "khaveesh/vim-fish-syntax" }
  -- use { "tpope/vim-rails", opt = true }

  --=[ Themes ]=--
  use {
    "folke/tokyonight.nvim",
    config = function()
      require "nv.plugins.theme"
    end,
  }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    --[[ run = ":CatppuccinCompile", ]]
    config = function()
      require("catppuccin").setup {
        integrations = {
          lsp_trouble = true,
          which_key = true,
          navic = true,
          telescope = true,
          notify = true,
          cmp = true,
          markdown = true,
          gitsigns = true,
          treesitter = true,
          telekasten = false,
          beacon = false,
          bufferline = false,
          dashboard = false,
          nvimtree = { enabled = false },
        },
        compile = {
          enabled = false,
          path = vim.fn.stdpath "cache" .. "/catppuccin",
        },
        color_overrides = {
          mocha = {
            base = "#07070a",
          },
        },
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.05,
        },
      }
    end,
  }

  --=[ UI ]=--
  use {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
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
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()
    end,
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
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require "nv.plugins.comments"
    end,
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
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/Documents/notes/work",
                home = "~/Documents/notes/home",
              },
            },
          },
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim",
  }

  --[[ to review

    https://github.com/folke/noice.nvim
    https://github.com/theHamsta/nvim-semantic-tokens

    chaoren/vim-wordmotion
    alok/notational-fzf-vim
    charlesmallah/lua-profiler
    windwp/nvim-spectre

    https://github.com/tamago324/nlsp-settings.nvim
    https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    https://github.com/akinsho/flutter-tools.nvim
    https://github.com/lukas-reineke/indent-blankline.nvim
    https://github.com/vhyrro/neorg
    https://github.com/ray-x/navigator.lua
    https://github.com/AckslD/nvim-neoclip.lua
    https://github.com/folke/zen-mode.nvim

    https://github.com/ziontee113/syntax-tree-surfer

    https://github.com/UserNobody14/tree-sitter-dart

    https://github.com/captainko/ckovim/blob/70d09e50320de74fb3f9b9314e2e9cf70d570f86/lua/cko/plugins/cmp.lua

    https://vale.sh/
    https://bhupesh.me/writing-like-a-pro-with-vale-and-neovim/

    set foldmethod=expr
    foldexpr=nvim_treesitter#foldexpr()

  --]]
end)

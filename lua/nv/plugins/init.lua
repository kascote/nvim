return {
  {
    dir = "~/.config/nvim/lua/vnav",
    config = function()
      require "vnav"
    end,
  },
  {
    dir = "~/.config/nvim/lua/mono/mono.lua",
    lazy = false,
    priority = 1000,
    config = function()
      require "test"
    end,
  },
  -- { dir = "~/.config/nvim/lua/test.lua", priority = 1000 },

  { "nvim-lua/plenary.nvim" },
  -- { "vim-scripts/LargeFile" },
  { "tpope/vim-repeat" },
  { "b0o/schemastore.nvim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "nv.mappings"
    end,
  },
  { "ray-x/lsp_signature.nvim" },

  { "kylechui/nvim-surround", config = true },
  { "j-hui/fidget.nvim", config = true, event = "VeryLazy" },
  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },
  {
    "tpope/vim-characterize",
    keys = "ga",
  },
  {
    "khaveesh/vim-fish-syntax",
    ft = "fish",
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeFocus", "UndotreeHide", "UndotreeShow", "UndotreeToggle" },
  },
  {
    "junegunn/vim-easy-align",
    cmd = { "EasyAlign" },
  },

  --=[ UI ]=--
  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.input(...)
      end
    end,
  },

  {
    "ruifm/gitlinker.nvim",
    config = true,
    keys = { "<leader>gy", "<leader>gY" },
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        keymaps = {}, -- disable default keymaps
      }
    end,
  },

  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
  },

  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup()
      -- Integration w/ nvim-cmp
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },

  {
    "folke/todo-comments.nvim",
    config = true,
    event = "VeryLazy",
  },

  {
    "akinsho/toggleterm.nvim",
    version = "^2.0.0",
    config = function()
      require("toggleterm").setup()
    end,
    cmd = { "Lf" },
    dependencies = {
      {
        "lmburns/lf.nvim",
        config = function()
          -- This feature will not work if the plugin is lazy-loaded
          -- vim.g.lf_netrw = 1

          require("lf").setup {
            escape_quit = false,
            border = "rounded",
            focus_on_open = false,
          }
        end,
      },
    },
  },
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },
}

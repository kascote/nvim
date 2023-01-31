return {
  {
    dir = "~/.config/nvim/lua/vnav",
    config = function()
      require "vnav"
    end,
    keys = {
      { "<C-h>", "<cmd>VNavLeft<cr>", desc = "Move to one pane left" },
      { "<C-j>", "<cmd>VNavDown<cr>", desc = "Move to one pane down" },
      { "<C-k>", "<cmd>VNavUp<cr>", desc = "Move to one pane up" },
      { "<C-l>", "<cmd>VNavRight<cr>", desc = "Move to one pane rigth" },
    },
  },
  -- {
  --   dir = "~/.config/nvim/lua/mono/mono.lua",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require "test"
  --   end,
  -- },

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
  -- {
  --   "moll/vim-bbye",
  --   cmd = { "Bdelete", "Bwipeout" },
  --   keys = {
  --     { "<leader>w", "<cmd>Bdelete<cr>", desc = "Close current buffer without close pane" },
  --   },
  -- },

  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>w", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>W", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
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
    keys = {
      { "<Enter>", "<cmd>EasyAlign<cr>", mode = "v", desc = "Align plugin" },
    },
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
    keys = {
      { "<leadery", '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', desc = "Github url to current line" },
      { "<leaderY", '<cmd>lua require"gitlinker".get_repo_url()<cr>', desc = "Github url to repository" },
      {
        "gy",
        '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>',
        mode = "v",
        desc = "Github url to current range",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {}, -- disable default keymaps
    },
    keys = {
      { "<leader>gn", '<cmd>lua require"gitsigns".next_hunk()<cr>', desc = "Jump to next Hunk" },
      { "<leader>gp", '<cmd>lua require"gitsigns".prev_hunk()<cr>', desc = "Jump to previous Hunk" },
      { "<leader>gv", '<cmd>lua require"gitsigns".preview_hunk()<cr>', desc = "Preview Hunk" },
      { "<leader>ga", '<cmd>lua require"gitsigns".stage_hunk()<cr>', desc = "Stage Hunk" },
      { "<leader>gu", '<cmd>lua require"gitsigns".reset_hunk()<cr>', desc = "Reset Hunk" },
      { "<leader>gbl", '<cmd>lua require"gitsigns".blame_line()<cr>', desc = "Blame Line" },
    },
  },

  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
    keys = {
      { "<leader>gm", "<cmd>GitMessenger<cr>", desc = "Toggle GitMessenger" },
    },
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
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<localleader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<localleader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<localleader>xx", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
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

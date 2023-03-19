return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        enabled = false,
      },
      "nvim-treesitter/nvim-treesitter-refactor",
      "windwp/nvim-ts-autotag",
      "RRethy/nvim-treesitter-endwise",
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = {
          {
            "numToStr/Comment.nvim",
            config = function()
              require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
              })
            end,
          },
        },
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          disable = function(_lang, bufnr)
            -- disable hightlight if the buffer has more that 50k lines
            return vim.api.nvim_buf_line_count(bufnr) > 50000
          end,
        },
        indent = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",       -- "gnn",
            node_incremental = "<c-space>",     -- "grn",
            scope_incremental = "<c-s>",        -- "grc",
            node_decremental = "<c-backspace>", -- "grm",
          },
        },
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = false },
          smart_rename = {
            enable = false,
            keymaps = {
              smart_rename = "grr",
            },
          },
          navigation = {
            enable = false,
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          },
        },
        textobjects = {
          enable = false,
          disable = {},
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["aC"] = "@class.outer",
              ["iC"] = "@class.inner",
              ["ac"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",
              ["ae"] = "@block.outer",
              ["ie"] = "@block.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["is"] = "@statement.inner",
              ["as"] = "@statement.outer",
              ["ad"] = "@comment.outer",
              ["am"] = "@call.outer",
              ["im"] = "@call.inner",
            },
          },
          swap = {
            enable = false,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          lsp_interop = {
            enable = true,
            peek_definition_code = {
              ["<Leader>y"] = "@function.outer",
              ["<Leader>Y"] = "@class.outer",
            },
          },
        },
        context_commentstring = {
          enable = true,
          -- disabled for integration with Commet plugin
          enable_autocmd = false,
        },
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "diff",
          "fish",
          "gitignore",
          "go",
          "help",
          "html",
          "http",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "meson",
          "ninja",
          "python",
          "query",
          "regex",
          "ruby",
          "rust",
          "scss",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vue",
          "yaml",
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
        },
        autotag = {
          enable = true,
        },
      })

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
  },
}

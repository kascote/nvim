require "nv.settings"
require "nv.lazy"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "nv.globals"
    -- require "nv.mappings"
    require "nv.filetype"
    require "nv.autocmds"
    -- require "nv.plugins.snipets"
    -- require "test"
  end,
})

--[[

  Neorg compile parsers
  CC="/opt/homebrew/bin/gcc-12" nvim -c "Neorg sync-parsers"

--]]

--[[ to review

    https://github.com/glacambre/firenvim
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

    https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/base16.lua
    https://github.com/nyoom-engineering/oxocarbon.nvim
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

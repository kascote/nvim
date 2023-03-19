require("nv.settings")
require("nv.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("nv.globals")
    -- require "nv.mappings"
    require("nv.filetype")
    require("nv.autocmds")
    -- require "nv.plugins.snipets"
    -- require "test"
  end,
})

--[[

  Neorg compile parsers
  CC="/opt/homebrew/bin/gcc-12" nvim -c "Neorg sync-parsers"

--]]
--[[ to review

    https://github.com/bennypowers/nvim-regexplainer
    https://github.com/dvoytik/hi-my-words.nvim
    https://github.com/glacambre/firenvim
    https://github.com/phaazon/mind.nvim
    https://github.com/akinsho/flutter-tools.nvim
    https://github.com/rhysd/conflict-marker.vim
    https://github.com/kevinhwang91/nvim-bqf
    https://github.com/rafamadriz/friendly-snippets/

    https://github.com/nyoom-engineering/oxocarbon.nvim
    chaoren/vim-wordmotion
    windwp/nvim-spectre

    https://github.com/ray-x/navigator.lua
    https://github.com/AckslD/nvim-neoclip.lua
    https://github.com/folke/zen-mode.nvim

    https://github.com/UserNobody14/tree-sitter-dart

    https://vale.sh/
    https://bhupesh.me/writing-like-a-pro-with-vale-and-neovim/

--]]

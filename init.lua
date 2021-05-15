--  require('nfx/nv/colors')
require('nfx/nv/settings')
require('nfx/nv/mappings')
require('nfx/nv/plugins')

require('nfx/plugins/lsp')
require('nfx/plugins/autopairs')
require('nfx/plugins/completion')
require('nfx/plugins/gitsigns')
require('nfx/plugins/lspsaga')
require('nfx/plugins/neosnippets')
require('nfx/plugins/nerdtree')
require('nfx/plugins/tabline')
-- require('plugins/statusline')
require('nfx/plugins/status-line2')
require('nfx/globals')

vim.cmd('colorscheme github_dark')

require('colorizer').setup()

--[[  TODO

  - RPL de una linea
  - RPL de una seccion
  - snippets
  - spell

  -- can be done ?
  - remove bg color from line number on gutter when focus lost

--]]


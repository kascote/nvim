-- disable filetype.vim and use only lua one
vim.g.do_filetype_lua = 1 
vim.g.did_load_filetypes = 0

--  require('nfx/nv/colors')
require('nfx/nv/settings')
require('nfx/globals')
require('nfx/nv/mappings2')
require('nfx/nv/plugins')
require('nfx/filetype')

require 'nfx.plugins.snipets'


-- vim.g.tokyonight_style='night'
-- vim.cmd('colorscheme tokyonight')
-- vim.cmd('colorscheme github_dark')

--[[  TODO

  - RPL de una linea
  - RPL de una seccion
  - snippets
  - spell

  -- can be done ?
  - remove bg color from line number on gutter when focus lost

--]]
-- vim.cmd('set nofixendofline')
-- vim.cmd('set noeol')


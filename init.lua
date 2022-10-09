--  require('nfx/nv/colors')
require "nv.settings"
require "nv.globals"
require "nv.mappings"
require "nv.plugins"
require "nv.filetype"
require "nv.autocmds"

require "nv.plugins.snipets"

--[[  TODO

  - RPL de una linea
  - RPL de una seccion

--]]
-- vim.cmd('set nofixendofline')
-- vim.cmd('set noeol')


--[[

view server capabilities of current file
vim.lsp.get_active_clients()[1].server_capabilities


--]]

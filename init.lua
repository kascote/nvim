--  require('nfx/nv/colors')
require "nv.settings"
require "nv.plugins"

-- if we are bootstraping, no need to continue
if _G.is_bootstrap then
  return
end

require "nv.mappings"
require "nv.globals"
require "nv.filetype"
require "nv.autocmds"

require "nv.plugins.snipets"

require 'test'

--[[

  Neorg compile parsers
  CC="/opt/homebrew/bin/gcc-12" nvim -c "Neorg sync-parsers"

--]]

" set tabline=%!nfx#tabline#render()

" TODO: is there a better way to generate a global module than use _G ?

lua << LUA
  local tabline = require("tab-line")
  _G.nfx_tabline = tabline
  vim.o.tabline = '%!v:lua.nfx_tabline.setup()'
LUA

require('custom.telescope')
-- require('custom.colors')

local saga = require 'lspsaga'
saga.init_lsp_saga({
  error_sign = '⋇',
  warn_sign = '‼',
  hint_sign = '☝',
  infor_sign = 'ℹ',
  dianostic_header_icon = ' ♖  ',
  code_action_icon = '♖ ',
  finder_definition_icon = '❱ ',
  finder_reference_icon = '☎ ',
  definition_preview_icon = '⋳  '
})


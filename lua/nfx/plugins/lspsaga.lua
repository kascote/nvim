local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = '➤',
  warn_sign = '➤',
  hint_sign = '➤',
  infor_sign = '➤',
  dianostic_header_icon = ' 🐛 ',
  code_action_icon = '💡',
  code_action_prompt = {
    enable = true,
    sign = false,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = '⭐ ',
  finder_reference_icon = '⭐ ',
  max_preview_lines = 20, -- lsp finder
  definition_preview_icon = '⭐ ',
  rename_prompt_prefix = '➤',
}

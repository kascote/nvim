local extensions = require('el.extensions')
local sections = require('el.sections')
-- local subscribe = require('el.subscribe')
local builtin = require('el.builtin')

--//-------------------------------------------------------------------------
local ale_status = function(_, buffer)
  if not vim.g.ale_enabled then
    return ''
  end

  -- local counts = vim.fn['ale#statusline#Count'](vim.api.nvim_get_current_buf())
  local counts = vim.fn['ale#statusline#Count'](buffer.bufnr)

  local all_errors = counts.error + counts.style_error
  local all_non_errors = counts.total - all_errors

  local sl = "%#StatusLineLow#" .. 'ale:['
  sl = sl .. "%*"                                     -- reset highlight group
  sl = sl .. "%#StatusLine#" .. all_non_errors
  sl = sl .. "%*"                                     -- reset highlight group
  sl = sl .. "%#StatusLineLow#" .. ":"
  sl = sl .. "%#StatusLineLinter#" .. all_errors
  sl = sl .. "%#StatusLineLow#" .. ']'

  return sl
end

--//-------------------------------------------------------------------------
local lsp_status = function(_, buffer)
  local bufId = buffer.bufnr
  if vim.tbl_isempty(vim.lsp.buf_get_clients(bufId)) then
    return ''
  end

  local sl = ''
  local cnt_info  = vim.lsp.diagnostic.get_count(bufId, [[Information]]) or 0
  local cnt_hint  = vim.lsp.diagnostic.get_count(bufId, [[Hint]]) or 0
  local cnt_warn  = vim.lsp.diagnostic.get_count(bufId, [[Warning]]) or 0
  local cnt_error = vim.lsp.diagnostic.get_count(bufId, [[Error]]) or 0

  sl = sl .. '%#StatuslineLow#lsp:['
  sl = sl .. '%#StatusLineLspInfo#' .. cnt_info
  sl = sl .. '%#StatuslineLow#:'
  sl = sl .. '%#StatusLineLspHint#' .. cnt_hint
  sl = sl .. '%#StatuslineLow#:'
  sl = sl .. '%#StatuslineLspWarn#' .. cnt_warn
  sl = sl .. '%#StatuslineLow#:'
  sl = sl .. '%#StatusLineLspError#' .. cnt_error
  sl = sl .. '%#StatuslineLow#]'

  return sl
end

--//-------------------------------------------------------------------------
local gitgutter_summary = function(_, buffer)
  -- local ok, res = pcall(vim.api.nvim_buf_get_var, buffer.bufnr, 'gitgutter')
  -- if ok then
  --   -- summary format: { added, modified, removed }
  --   local summary = res.summary
  --   return summary and string.format("[+%d ~%d -%d]", summary[1], summary[2], summary[3]) or ''
  -- else
  --   return ''
  -- end

  local ok, res = pcall(vim.api.nvim_buf_get_var, buffer.bufnr, 'gitsigns_status')
  if ok then
    return res
  else
    return ''
  end
end


--//-------------------------------------------------------------------------
local buf_enc = function(_, buffer)
  if (buffer.name == '') then
    return ''
  end

  return '[' .. vim.bo.fenc .. ']'
end

--//-------------------------------------------------------------------------
local line_col = function()
  local sl = "%#StatusLineLow#["
  sl = sl .. "%#StatusLine#%-03l"
  sl = sl .. "%#StatusLineLow#" .. ':'
  sl = sl .. "%#StatusLine#%-03c"
  sl = sl .. "%#StatusLineLow#]"

  return sl
end

--//-------------------------------------------------------------------------
local generator = function()
  local el_segments = {
    status_line = {
      extensions.mode,
      ' ',
      ale_status,
      ' ',
      lsp_status,
      ' ',
      gitgutter_summary,
      sections.split,
      line_col(),
      builtin.readonly,
      ' ',
      builtin.filetype,
      ' ',
      buf_enc,
    },
    tatus_line_nc = {
      builtin.file,
      sections.collapse_builtin {
        ' ',
        builtin.modified_flag
      },
    }
  }

  return el_segments
end

require('el').setup { generator = generator }

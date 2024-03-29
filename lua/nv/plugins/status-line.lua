local vim = vim
local api = vim.api
local M = {}

local spacer = ' '

-- Mode Prompt Table
local current_mode = setmetatable({
      ['n']  = { 'NORMAL   ', 'StatusLineModeNormal' },
      ['no'] = { 'N·Operator Pending', 'StatusLineModeNormal' },
      ['v']  = { 'VISUAL   ', 'StatusLineModeVisual' },
      ['V']  = { 'V·Line   ', 'StatusLineModeVisual' },
      ['^V'] = { 'V·Block  ', 'StatusLineModeVisual' },
      ['s']  = { 'Select   ', 'StatusLineModeVisual' },
      ['S']  = { 'S·Line   ', 'StatusLineModeVisual' },
      ['^S'] = { 'S·Block  ', 'StatusLineModeVisual' },
      ['i']  = { 'INSERT   ', 'StatusLineModeInsert' },
      ['ic'] = { 'INSERT   ', 'StatusLineModeInsert' },
      ['ix'] = { 'INSERT   ', 'StatusLineModeInsert' },
      ['R']  = { 'Replace  ', 'StatusLineModeReplace' },
      ['Rv'] = { 'V·Replace', 'StatusLineModeReplace' },
      ['c']  = { 'COMMAND  ', 'StatusLineModeCommand' },
      ['cv'] = { 'Vim Ex   ', 'StatusLineModeCommand' },
      ['ce'] = { 'Ex       ', 'StatusLineModeCommand' },
      ['r']  = { 'Prompt   ', 'StatusLineModeCommand' },
      ['rm'] = { 'More     ', 'StatusLineModeCommand' },
      ['r?'] = { 'Confirm  ', 'StatusLineModeCommand' },
      ['!']  = { 'Shell    ', 'StatusLineModeCommand' },
      ['t']  = { 'TERMINAL ', 'StatusLineModeCommand' }
    }, {
      -- fix weird issues
      __index = function(_, _)
        return { 'V·Block', 'StatusLineModeVisual' }
      end
    }
)

function M.filePrefix()
  local basename = vim.fn.expand('%:h')
  if basename == '' or basename == '.' then
    return ''
  end
  local base = vim.fn.fnamemodify(basename, ':~:.')
  base = vim.fn.substitute(base, '/$', '', '')
  return base .. '/'
end

-- {
--   ["0"] = 0,
--   ["1"] = 0,
--   error = 0,
--   info = 0,
--   style_error = 0,
--   style_warning = 0,
--   total = 0,
--   warning = 0
-- }
function M.aleStatus()
  if not vim.g.ale_enabled then
    return ''
  end

  local counts = vim.fn['ale#statusline#Count'](vim.api.nvim_get_current_buf())

  local all_errors = counts.error + counts.style_error
  local all_non_errors = counts.total - all_errors

  if counts.total == 0 then
    return 'ale:[0:0]'
  end

  local status = "%#StatusLineLow#" .. 'ale:['
  status = status .. "%*"                                     -- reset highlight group
  status = status .. "%#StatusLine#" .. all_non_errors
  status = status .. "%*"                                     -- reset highlight group
  status = status .. "%#StatusLineLow#" .. ":"
  status = status .. "%#StatusLineLinter#" .. all_errors
  status = status .. "%#StatusLineLow#" .. ']'

  return status
  -- return string.format('[%d:%d]', all_non_errors, all_errors)
end

function M.lspStatus(bufId)
  local sl = ''
  -- print(bufId, vim.tbl_isempty(vim.lsp.buf_get_clients(bufId)))
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(bufId)) then
    sl = sl .. '%#StatuslineLow#lsp:['
    sl = sl .. vim.fn.printf('%%#StatusLineLspInfo#%%{luaeval("vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }) or 0")}', bufId)
    sl = sl .. '%#StatuslineLow#:'
    sl = sl .. vim.fn.printf('%%#StatusLineLspHint#%%{luaeval("vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }) or 0")}', bufId)
    sl = sl .. '%#StatuslineLow#:'
    sl = sl .. vim.fn.printf('%%#StatuslineLspWarn#%%{luaeval("vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }) or 0")}', bufId)
    sl = sl .. '%#StatuslineLow#:'
    sl = sl .. vim.fn.printf('%%#StatusLineLspError#%%{luaeval("vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) or 0")}', bufId)
    sl = sl .. '%#StatuslineLow#]'
  else
      sl = sl .. '%#MyStatuslineLow#lsp-off'
  end
  return sl
end

function M.activeLine()
  local statusline = ""
  local mode = api.nvim_get_mode()['mode']
  local modeStr = current_mode[mode][1]
  local modeColor = current_mode[mode][2]
  -- :lua print(vim.inspect(vim.api.nvim_buf_get_option(0, 'fenc')))
  local fenc = vim.bo.fenc
  local ft = vim.bo.ft
  local column = vim.fn.virtcol('.')
  local width = vim.fn.virtcol('$')
  local line = vim.fn.line('.')
  local height = vim.fn.line('$')

  statusline = statusline.."%#"..modeColor.."#"
  statusline = statusline..spacer..modeStr..spacer.."%*"
  statusline = statusline.."%*" -- reset highlight group
  -- statusline = statusline.."%#StatusLineLow#"
  -- statusline = statusline..M.filePrefix()
  -- statusline = statusline.."%#StatusLine#"
  -- statusline = statusline.."%*" -- reset highlight group
  -- statusline = statusline.."%t"..spacer
  -- statusline = statusline.."%*" -- reset highlight group
  statusline = statusline.."%#StatusLineLinter#"
  statusline = statusline..M.aleStatus()..M.lspStatus()..spacer
  statusline = statusline.."%*" -- reset highlight group
  -- split point
  statusline = statusline.."%="
  statusline = statusline.."["..ft..spacer..fenc.."]"..spacer
  statusline = statusline.."%*" -- reset highlight group
  statusline = statusline.."%#StatusLineRHS#"
  statusline = statusline..spacer..'ℓ'..string.format("%03s",line)..'/'..string.format("%-03s",height)..spacer
  statusline = statusline..spacer..'𝚌'..string.format("%03s",column)..'/'..string.format("%-03s",width-1)..spacer

  statusline = statusline.."%*" -- reset highlight group

  return statusline
end

function M.inactiveLine()
  local statusline = spacer
  statusline = statusline..'%f'
  return statusline
end

return M

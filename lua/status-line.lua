local vim = vim
local api = vim.api
local M = {}

local spacer = ' '
local special_buffers = {
  ['nerdtree'] = 'NERDTree',
  ['help'] = 'Help',
}

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
    return ''
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

function M.lspStatus()
  local sl = ''
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    sl = sl .. '%#StatuslineLow#lsp:['
    sl = sl .. '%#StatusLineLspInfo#%{luaeval("vim.lsp.diagnostic.get_count(0, [[Information]]) or 0")}'
    sl = sl .. '%#StatuslineLow#:'
    sl = sl .. '%#StatusLineLspHint#%{luaeval("vim.lsp.diagnostic.get_count(0, [[Hint]]) or 0")}'
    sl = sl .. '%#StatuslineLow#:'
    sl = sl .. '%#StatuslineLspWarn#%{luaeval("vim.lsp.diagnostic.get_count(0, [[Warning]]) or 0")}'
    sl = sl .. '%#StatuslineLow#:'
    sl = sl .. '%#StatusLineLspError#%{luaeval("vim.lsp.diagnostic.get_count(0, [[Error]]) or 0")}'
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
  statusline = statusline..spacer..'ℓ '..string.format("%04s",line)..'/'..string.format("%-04s",height)..spacer
  statusline = statusline..spacer..'𝚌 '..string.format("%04s",column)..'/'..string.format("%-04s",width)..spacer

  statusline = statusline.."%*" -- reset highlight group

  return statusline
end

function M.inactiveLine()
  local statusline = spacer
  statusline = statusline..'%f'
  return statusline
end

return M

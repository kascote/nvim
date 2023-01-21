--[[
  - custom characters for status change
  - custom color for special buffers
--]]


local M = {}
local vim = vim
local api = vim.api
local fn = vim.fn
local specialNames = {
  nerdtree = 'NerdTree',
  fzf = 'FZF',
  qf = 'QuickFix',
  locallist = 'LocalList',
  undotree = 'UndoTree',
  tagbar = 'TagBar',
  diff = 'Diff',
  TelescopePrompt = 'Telescope Prompt'
}
local lineDisplay = {
  bufNameLen = 0,
  tabPageLen = 0
}

local function countModified(bufName)
                                        -- [[ read in reverse order ]]
  return vim.fn.count(                  -- cound the modified buffers
    fn.map(                         -- map to an array with the changed values
      fn.filter(                    -- remove the current buffer from the count
        fn.filter(                  -- get only the listed buffers
          fn.copy(                  -- get a copy of the buffer
            fn.getbufinfo()
          ),
          'v:val.listed'
        ),
        "v:val.name !~ '" .. bufName .. "'"
      ),
      'v:val.changed'
    ),
    1
  ) > 0
end

local function formatBufferName(bname)
  local basePath = fn.fnamemodify(bname, ":p:~:.:h")
  local baseName = fn.fnamemodify(bname, ":p:t")
  local label
  local labelRaw
  if bname == '' then
    label = ' %#TabLine#(empty) '
    labelRaw = ' (empty) '
  else
    label = ' %#TabLine#' .. basePath .. '/' .. '%#TabLineSel#' .. baseName .. " %*"
    labelRaw = ' ' .. basePath .. '/' .. baseName .. ' '
  end

  -- length of the buffer title
  lineDisplay.bufNameLen = #labelRaw
  return label
end

local function formatTabPages()
  local pager = string.format('%s/%s', vim.fn.tabpagenr(), vim.fn.tabpagenr('$'))
  lineDisplay.tabPageLen = #pager
  return pager
end

local function resolveBufName()
  local bufName = api.nvim_buf_get_name(0)
  local modifiedCurrent = fn.getbufinfo('%')[1].changed
  local modifiedBuffers = countModified(bufName)
  local label = '%#TabLineModNone#' .. ' '

  if modifiedBuffers then
    label = '%#TabLineMod#' .. '●'
  end

  local currentMod = ' '
  if (modifiedCurrent == 1) then
    currentMod = '%#TabLineModBuf#' .. '●'
  end
  lineDisplay.bufNameLen = lineDisplay.bufNameLen + 1

  return label .. formatBufferName(bufName) .. currentMod
end

local function buildTabLine(name)
  local pager = formatTabPages()
  local widthPad = math.ceil(vim.o.columns / 2) - math.ceil(lineDisplay.bufNameLen / 2)- lineDisplay.tabPageLen
  local pad = string.rep(' ', widthPad)

  return pager .. pad .. name .. pad
end

local function getSpecialBufName()
  local specialBuffer = specialNames[vim.bo.ft]
  if specialBuffer ~= nil then
    lineDisplay.bufNameLen = #specialBuffer
    return specialBuffer
  end
  return nil
end

function M.setup()
  local specialBuffer = getSpecialBufName()

  if (specialBuffer ~= nil) then
    return buildTabLine(specialBuffer)
  else
    return buildTabLine(resolveBufName())
  end
end

-- return M

_G.nfx_tabline = M
vim.o.tabline = '%!v:lua.nfx_tabline.setup()'

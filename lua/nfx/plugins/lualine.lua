local fn = vim.fn
local api = vim.api

local lineDisplay = {
  bufNameLen = 0,
  tabPageLen = 0
}

local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

local function fullname()
  return vim.fn.expand "%:f"
end

local function middle()
  return "%="
end

-- fix a bug when is null
local function nada()
  return " "
end

local function countModified(bufName)
                                        -- [[ read in reverse order ]]
  return fn.count(                  -- cound the modified buffers
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

local function filename()
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

vim.cmd [[autocmd User LspProgressUpdate let &ro = &ro]]

local config = {
  options = {
    theme = "tokyonight",
    -- section_separators = { "", "" },
    -- component_separators = { "", "" },
    section_separators = { "", "" },
    component_separators = { "", "" },
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "diagnostics", sources = { "nvim_lsp" } } },
    lualine_c = { "diff" },
    lualine_x = { nada },
    lualine_y = {},
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { fullname },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { "branch" },
    lualine_b = { lsp_progress },
    lualine_c = { { middle, separator = "" }, { filename } },
    lualine_x = { "filetype" },
    lualine_y = { "encoding" },
    lualine_z = {},
  },
  extensions = { "nvim-tree" },
}

require("lualine").setup(config)

local fn = vim.fn
local api = vim.api

local lineDisplay = {
  bufNameLen = 0,
  tabPageLen = 0,
}

local filetypeExclude = {
  "",
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "TelescopePrompt",
  "floaterm",
}

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
  -- read in reverse order
  return fn.count( -- cound the modified buffers
    fn.map( -- map to an array with the changed values
      -- fn.filter( -- remove the current buffer from the count
        fn.filter( -- get only the listed buffers
          fn.copy( -- get a copy of the buffer
            fn.getbufinfo()
          ),
          "v:val.listed"
        ),
        -- "v:val.name !~ '" .. bufName .. "'"
      -- ),
      "v:val.changed"
    ),
    1
  ) > 0
end

local function formatBufferName(bname)

  if vim.tbl_contains(filetypeExclude, vim.bo.filetype) then
    return " %#StatusLineFilename#" .. vim.bo.filetype
  end

  local basePath = fn.fnamemodify(bname, ":p:~:.:h")
  local baseName = fn.fnamemodify(bname, ":p:t")
  local label
  local labelRaw
  if bname == "" then
    label = " %#StatusLineFilename#(empty) "
    labelRaw = " (empty) "
  else
    label = " %#StatusLineFilename#" .. basePath .. "/" .. "%#StatusLineFilenameHi#" .. baseName .. " %*"
    labelRaw = " " .. basePath .. "/" .. baseName .. " "
  end

  -- length of the buffer title
  lineDisplay.bufNameLen = #labelRaw
  return label
end

local function filename()
  local bufName = api.nvim_buf_get_name(0)
  local modifiedBuffers = countModified(bufName)
  local label = "%#DiffDelete#" .. " "

  if modifiedBuffers then
    label = "%#DiffDelete#" .. "●"
  end

  --[[ local currentMod = " "
  if modifiedCurrent == 1 then
    currentMod = "%#TabLineModBuf#" .. "●"
  end ]]
  lineDisplay.bufNameLen = lineDisplay.bufNameLen + 1

  return label .. formatBufferName(bufName) -- .. currentMod
end

local function mydiff()
  local ok, res = pcall(vim.api.nvim_buf_get_var, 0, "gitsigns_status_dict")
  local diff = {}
  if ok then
    if res.added ~= 0 and res.added ~= nil then
      table.insert(diff, "%#StatusLineDiffAdd# +" .. res.added .. " %*")
    end
    if res.removed ~= 0 and res.removed ~= nil then
      table.insert(diff, "%#StatusLineDiffDel# -" .. res.removed .. " %*")
    end
    if res.changed ~= 0 and res.changed ~= nil then
      table.insert(diff, "%#StatusLineDiffChg# ~" .. res.changed .. " %*")
    end
    return table.concat(diff, "")
  else
    return ""
  end
end

local config = {
  options = {
    -- theme = "tokyonight",
    theme = "catppuccin",
    -- section_separators = { "", "" },
    -- component_separators = { "", "" },
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        color = { bg = "#313244" },
      },
    },
    lualine_c = { mydiff },
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
    lualine_a = {},
    lualine_b = { { "branch", color = { bg = "#1e1e2e" } } },
    lualine_c = { { middle, separator = "" }, { filename } },
    lualine_x = { { "filetype", color = { fg = "#f2cdcd", gui = "italic" } } },
    lualine_y = { { "encoding", color = { bg = "#1e1e2e" } } },
    lualine_z = {},
  },
  extensions = { "chadtree", "quickfix" },
}

require("lualine").setup(config)

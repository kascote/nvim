local navic = require "nvim-navic"

local M = {}

M.winbar_filetype_exclude = {
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
}

local function isempty(s)
  return s == nil or s == ""
end

local function get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

local get_filename = function()
  local filename = vim.fn.expand "%:t"
  -- local extension = vim.fn.expand "%:e"

  if isempty(filename) then
    return ""
  end

  return " " .. "%#Comment#" .. filename .. "%*"
end

local get_location = function()
  local location = navic.get_location()

  if not navic.is_available() or location == "error" or isempty(location) then
    return ""
  end

  -- return require("nv.icons").codicon.chevronRight .. " " .. location
  return location
end

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end
  return false
end

M.get_winbar = function()
  if excludes() then
    return
  end
  local location = {}

  table.insert(location, get_filename())
  table.insert(location, get_location())

  if #location > 0 and get_buf_option "mod" then
    table.insert(location, "%#LineNr#●%*")
  end

  -- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  vim.o.winbar = table.concat(location, " ")
end

return M

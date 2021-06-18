--[[
borrowed from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/stylua.lua
--]]

local Path = require "plenary.path"
local Job = require "plenary.job"

local lspconfig_util = require "lspconfig.util"

local cached_configs = {}

local root_finder = lspconfig_util.root_pattern ".git"
local project_finder = function(path, config_file)
  if cached_configs[path] == nil then
    local file_path = Path:new(path)
    local root_path = Path:new(root_finder(path))

    local file_parents = file_path:parents()
    local root_parents = root_path:parents()

    local relative_diff = #file_parents - #root_parents
    for index, dir in ipairs(file_parents) do
      if index > relative_diff then
        break
      end

      local project_path = Path:new { dir, config_file }
      if project_path:exists() then
        cached_configs[path] = project_path:absolute()
        break
      end
    end
  end

  return cached_configs[path]
end

local runner = function(bufnr, config_file, executor)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local filepath = Path:new(vim.api.nvim_buf_get_name(bufnr)):absolute()
  local project_config = project_finder(filepath, config_file)

  if not project_config then
    return
  end

  local output = executor(project_config, filepath)

  if not output then
    return
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, output)
end

local prettier_formatter = function(project_config, filepath)
  local j = Job:new {
    "npx",
    "prettier",
    "--config",
    project_config,
    "-stdin-filepath",
    filepath,
    writer = vim.api.nvim_buf_get_lines(0, 0, -1, false),
  }

  local output = j:sync()

  if j.code ~= 0 then
    -- Schedule this so that it doesn't do dumb stuff like printing two things.
    vim.schedule(function()
      print "[formatter] Failed to process due to errors"
    end)

    return
  end

  return output
end

local lua_formatter = function(project_config)
  local j = Job:new {
    "stylua",
    "--config-path",
    project_config,
    "-",
    writer = vim.api.nvim_buf_get_lines(0, 0, -1, false),
  }

  local output = j:sync()

  if j.code ~= 0 then
    -- Schedule this so that it doesn't do dumb stuff like printing two things.
    vim.schedule(function()
      print "[formatter] Failed to process due to errors"
    end)

    return
  end

  return output
end

--[[ ////////////////////////////////////////////////////////////////////  --]]

local formatter = {}

formatter.lua = function(bufnr)
  runner(bufnr, "stylua.toml", lua_formatter)
end

formatter.prettier = function(bufnr)
  runner(bufnr, ".prettierrc", prettier_formatter)
end

return formatter

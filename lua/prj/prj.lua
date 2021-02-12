local vim = vim
local validate = vim.validate
local api = vim.api

local M = {
  path = require('nfx.path')
}

function M.search_ancestors(startpath, func)
  validate { func = {func, 'f'} }
  if func(startpath) then return startpath end
  for path in M.path.iterate_parents(startpath) do
    if func(path) then return path end
  end
end

-- root_pattern('.git', 'node_modules')
function M.root_pattern(...)
  local patterns = vim.tbl_flatten {...}
  local function matcher(path)
    for _, pattern in ipairs(patterns) do
      if M.path.exists(M.path.join(path, pattern)) then
        return path
      end
    end
  end
  return function(startpath)
    return M.search_ancestors(startpath, matcher)
  end
end

function M.find_git_ancestor(startpath)
  return M.search_ancestors(startpath, function(path)
    if M.path.is_dir(M.path.join(path, ".git")) then
      return path
    end
  end)
end

function M.find_root_dir()
  local name = api.nvim_buf_get_name(0)
  local dir = M.root_pattern('.git')(name) or vim.loop.os_homedir()
  print('root dir: ' .. dir)
  return dir
end

return M

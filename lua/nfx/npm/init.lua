local NPM_BASE_URL = "https://registry.npmjs.org/"
local semver = require("nfx.npm.semver")

local M = {
  _cache = {},
}

local function sort_versions(pkg_data)
  local keyset = {}
  for k, _ in pairs(pkg_data) do
    keyset[#keyset + 1] = semver(k)
  end

  table.sort(keyset, function(a, b)
    return a > b
  end)

  -- local sorted = {}
  for _, version in ipairs(keyset) do
    vim.fn.complete_add(string.format("%s", version))
    if vim.fn.complete_check() ~= 0 then
      break
    end
    -- table.insert(sorted, string.format("%s", version))
  end

  -- return sorted
end

function M.fetch_package(name)
  local inCache = M._cache[name]
  if inCache then
    local isOld = os.time() - inCache.time
    if isOld < 120 then -- two minutes cache
      return inCache.versions
    end
  end

  local handle = io.popen("curl -sL " .. NPM_BASE_URL .. name, "r")
  local result = handle:read("*a")
  handle:close()

  if result then
    local js = vim.fn.json_decode(result)
    M._cache[name] = {
      versions = sort_versions(js.versions),
      time = os.time(),
    }
    return M._cache[name].versions
  else
    return nil
  end
end

function M.lookupPackage(find_start, base)
  if (find_start > 0) then
    return vim.fn.col('.')
  end

  local mtr2 = vim.fn.matchstr(vim.fn.getline('.'), [[^\s*"\zs[[:alnum:]\-\@\/._]*\ze"]]) -- luacheck: ignore
  M.fetch_package(mtr2)
  -- local packages = M.fetch_package(mtr2)
  -- if not packages or next(packages) == nil then
  --   print('no packages found')
  -- end
  return {} -- packages
end

return M

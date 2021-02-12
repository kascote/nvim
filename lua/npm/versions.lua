-- https://github.com/meain/vim-package-info/blob/master/rplugin/node/vim-package-info/parsers/package-json.js
-- https://github.com/mhinz/vim-crates/blob/master/plugin/crates.vim

-- tr - \~ | sort -V | tr \~ -
-- curl -s https://api.github.com/repos/glpi-project/glpi/releases | jq --raw-output '.[] | .tag_name' | tr - \~ | sort -rV | tr \~ -


local json = require('npm.json')
local semver = require('npm.semver');

local NPM_BASE_URL = 'https://registry.npmjs.org/'

local M = {
  _cache = {}
}

--
-- get the available versions from npm as
--   {
--     "0.2.1": {},
--     "0.0.1": {},
--     "0.3.1": {}
--   }
--
-- then generate an dict as
--  {
--    1: "0.2.1",
--    2: "0.0.1",
--    3: "0.3.1",
--  }
--
-- sort it using semver values and return an array as
--
--  [
--    "0.3.1",
--    "0.2.1",
--    "0.0.1",
--  ]
--
-- reference
-- https://stackoverflow.com/a/15706820
--
local function available_versions(pkg_data)
  local keyset = {}
  for k, _ in pairs(pkg_data) do
    keyset[#keyset+1]=semver(k)
  end

  table.sort(keyset, function(a,b) return a > b end)

  local sorted = {}
  for _, version in ipairs(keyset) do
    table.insert(sorted, string.format("%s", version))
  end

  return sorted
end

local function fetch_package(name)

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
    local js = json.parse(result)
    M._cache[name] = {
      versions = available_versions(js.versions),
      time = os.time()
    }
    return M._cache[name].versions
  else
    print('error accessing: ' .. name)
    return nil
  end
end

function M.lookupPackage(find_start, base)
  if (find_start > 0) then
    return vim.fn.col('.')
  end

  local line = vim.api.nvim_get_current_line()
  local mtr2 = vim.fn.matchstr(vim.fn.getline('.'), [[^\s*"\zs[[:alnum:]\-\@\/._]*\ze"]]) -- luacheck: ignore
  local packages = fetch_package(mtr2)
  if not packages or next(packages) == nil then
    print('no packages found')
  end
  return packages
end

return M

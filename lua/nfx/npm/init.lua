-- https://github.com/meain/vim-package-info/blob/master/rplugin/node/vim-package-info/parsers/package-json.js
-- https://github.com/mhinz/vim-crates/blob/master/plugin/crates.vim

-- tr - \~ | sort -V | tr \~ -
-- curl -s https://api.github.com/repos/glpi-project/glpi/releases | jq --raw-output '.[] | .tag_name' | tr - \~ | sort -rV | tr \~ -


local json = require('nfx.npm.json')
local semver = require('nfx.npm.semver');

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
    local js = json.parse(result)
    M._cache[name] = {
        versions = available_versions(js.versions),
        time = os.time()
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
  local packages = M.fetch_package(mtr2)
  if not packages or next(packages) == nil then
    print('no packages found')
  end
  return packages
end

function M.test()
  local test_str = [[      "ab-def":   "~1.2.3" ]]

  -- local result = vim.fn.matchstr(test_str, [[^\s*"\zs[[:alnum:]\-\@\/._]*\ze":\s*"\zs[[:alnum].]*\ze]]) -- luacheck: ignore
  -- local result = vim.fn.matchstr(test_str, [[^\s*"\([[:alnum:]\-\@\/._]*\)":\s*"\([\~\^\d+.]*\)]])
  -- local result = vim.fn.matchstr(test_str, [[^\s*"\([[:alnum:]\-\@\/._]*\)":\s*"\(\d*\)]])
  local result = vim.fn.matchstrpos(test_str, [[\v^\s*"([[:alnum:]\-\@\/._]*)":\s*"([\~\^\0-9\.]*)]])

  dump('result', result)
end

vim.cmd([[nnoremap 22 <cmd>lua require('plenary.reload').reload_module('nfx.npm');require('nfx.npm')<CR>]])
vim.cmd([[nnoremap 55 <cmd>lua dump(require('nfx.npm').fetch_package('moment'))<CR>]])
vim.cmd([[nnoremap 66 <cmd>lua dump(require('nfx.npm').test('moment'))<CR>]])

return M

local alternateFiles = {
  javascript = {
    ["js"] = "test.js",
    ["jsx"] = "test.jsx",
    ["test.jsx"] = "jsx",
    ["test.js"] = "js",
  },
  javascriptreact = {
    ["js"] = "test.js",
    ["jsx"] = "test.jsx",
    ["test.jsx"] = "jsx",
    ["test.js"] = "js",
  }
}

local M = {}

function M.alternate()
  local base = vim.fn.expand('%:h')
  local fname = vim.fn.expand('%:t')
  local currentExt = vim.fn.expand('%:e:e:e:e')
  local baseFname = vim.fn.fnamemodify(fname, ':r:r:r:r')
  local ft = vim.bo.filetype

  if (alternateFiles[ft]) then
    for _, ext in pairs(alternateFiles[ft]) do
      if (ext == currentExt) then
        local altFile = string.format('%s/%s.%s', base, baseFname, alternateFiles[ft][ext])
        if (vim.fn.filereadable(altFile) == 1) then
          vim.cmd(string.format("%s %s", 'edit', altFile))
        end
      end
    end
  end
end

return M

local M = {}

function M.tele_seiken(opts)
  local prjRoot = vim.loop.cwd()
  require("telescope.builtin").find_files {
    cwd = prjRoot .. opts.path,
  }
end

return M

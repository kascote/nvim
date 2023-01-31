local lsp = vim.lsp
local api = vim.api

local M = {}

-- https://dart.googlesource.com/sdk/+/1d8b81283c1dee38f1dd87b71b16aa1648b01155/pkg/analysis_server/lib/src/lsp/constants.dart
-- "edit.sortMembers",
-- "edit.organizeImports",
-- "edit.sendWorkspaceEdit",
-- "refactor.perform"

M.organize_imports = function()
  local cur_buf = api.nvim_get_current_buf()
  local cur_buf_name = api.nvim_buf_get_name(cur_buf)
  local params = {
    command = "edit.organizeImports",
    arguments = { cur_buf_name },
    title = "",
  }
  lsp.buf_request_sync(cur_buf, "workspace/executeCommand", params, 1500)
end

return M

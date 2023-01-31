local vimLsp = vim.lsp

local M = {}

M.diagIcons = {
  error = " ", -- 
  warn = " ", -- 
  hint = " ", -- 
  info = " ", -- 
}

M.diagnosticHighliter = {
  { name = "DiagnosticSignError", text = M.diagIcons.error },
  { name = "DiagnosticSignWarn", text = M.diagIcons.warn },
  { name = "DiagnosticSignHint", text = M.diagIcons.hint },
  { name = "DiagnosticSignInfo", text = M.diagIcons.info },
}

M.diagnosticSigns = {
  Error = M.diagIcons.error,
  Warning = M.diagIcons.warn,
  Hint = M.diagIcons.hint,
  Information = M.diagIcons.Info,
}

function M.getKeyMaps()
  local prefix = "<leader>l"
  local format = require("nv.plugins.lsp.format").format

  return {
    { prefix .. "a", vim.lsp.buf.code_action, { desc = "Show Code Actions" }, { has = "codeAction" } },
    { prefix .. "c", vim.lsp.buf.incoming_calls, { desc = "Show Incoming calls" } },
    { prefix .. "D", vim.lsp.buf.declaration, { desc = "search Declarations" } },
    { prefix .. "d", "<cmd>Telescope lsp_definitions<cr>", { desc = "search definitions" } }, -- lua vim.lsp.buf.definition()
    -- { prefix .. "f", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>", { desc = "Format current file" } },
    { prefix .. "f", format, { desc = "Format current file" }, { has = "documentFormatting" } },
    { prefix .. "f", format, { desc = "Format Range" }, { mode = "v", has = "documentRangeFormatting" } },
    { prefix .. "i", "<cmd>Telescope lsp_implementations<cr>", { desc = "search Implementations" } }, -- lua vim.lsp.buf.implementation()
    { "K", vim.lsp.buf.hover, { desc = "toggle Hover on current identifier" } },
    { prefix .. "o", vim.lsp.buf.outgoing_calls, { desc = "Show Outgoing calls" } },
    { prefix .. "q", vim.diagnostic.open_float, { desc = "show Diagnostics on current line" } },
    { prefix .. "r", vim.lsp.buf.rename, { desc = "Rename identifier" }, { has = "rename" } },
    { prefix .. "s", vim.lsp.buf.signature_help, { desc = "Show Signature Help" }, { has = "signatureHelp" } },
    { prefix .. "t", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "search Type Definitions" } }, -- lua vim.lsp.buf.type_definition()
    { prefix .. "x", "<cmd>Telescope lsp_references<cr>", { desc = "search References" } }, -- lua vim.lsp.buf.references()
    { prefix .. "wa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace folder" } },
    {
      prefix .. "wl",
      "<cmd>lua P(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
      { desc = "Show workspace folders" },
    },
    { prefix .. "wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace folder" } },
    {
      prefix .. "ws",
      "<cmd>lua R('nv.telescope_utils').lsp_workspace_symbols()<cr>",
      { desc = "Show Workspace Symbols" },
    },
    {
      prefix .. "us",
      "<cmd>lua R('nv.telescope_utils').lsp_document_symbols()<cr>",
      { desc = "Show Document Symbols" },
    },
    {
      prefix .. "rr",
      "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd [[e!]]<CR>",
      { desc = "Stop Clients and restart LSP" },
    },
    { "]d", M.diagnostic_goto(true), { desc = "Next Diagnostic" } },
    { "[d", M.diagnostic_goto(false), { desc = "Prev Diagnostic" } },
    { "]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next Error" } },
    { "[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" } },
    { "]w", M.diagnostic_goto(true, "WARN"), { desc = "Next Warning" } },
    { "[w", M.diagnostic_goto(false, "WARN"), { desc = "Prev Warning" } },
  }
end

function M.set_keymap(client, bufnr)
  local sks = vim.keymap.set
  local baseOpts = { silent = true, noremap = true, nowait = true, buffer = bufnr }
  local baseCond = { mode = "n" }

  local setKeyMap = function(lhs, rhs, options, conditions)
    local opts = vim.tbl_extend("force", baseOpts, options or {})
    local cndt = vim.tbl_extend("force", baseCond, conditions or {})
    if not cndt.has or client.server_capabilities[conditions.has .. "Provider"] then
      sks(cndt.mode, lhs, rhs, opts)
    end
  end

  for _, value in ipairs(M.getKeyMaps()) do
    setKeyMap(value[1], value[2], value[3], value[4])
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

function M.custom_init(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
  client.config.flags.debounce_text_changes = 250
end

function M.custom_attach(client, bufnr)
  -- local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  require("lsp_signature").on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = false,
    handler_opts = {
      border = "rounded",
    },
    toggle_key = "<C-x>",
    zindex = 49,
  }, bufnr)

  --[[ if client.name == "typescript" or client.name == "tsserver" then
    require("nv.plugins.lsp.ts-utils").setup(client)
  end ]]

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  if client.server_capabilities.documentHighlightProvider then
    local doc_highlight = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd(
      "CursorHold",
      { group = doc_highlight, buffer = 0, callback = vim.lsp.buf.document_highlight }
    )
    vim.api.nvim_create_autocmd(
      "CursorMoved",
      { group = doc_highlight, buffer = 0, callback = vim.lsp.buf.clear_references }
    )
  end
end

function M.disable_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

function M.capabilities()
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  --[[ local capabilities = vim.lsp.protocol.make_client_capabilities() ]]

  --[[ return require("cmp_nvim_lsp").update_capabilities(capabilities) ]]
  return require("cmp_nvim_lsp").default_capabilities()
end

function M.setupDiagnosticHighlihters()
  for _, sign in ipairs(M.diagnosticHighliter) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end
end

function M.setupDiagnosticSigns()
  for type, icon in pairs(M.diagnosticSigns) do
    local hlLsp = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hlLsp, { text = icon, texthl = hlLsp, numhl = "" })
  end
end

function M.setupGlobalHandlers()
  vimLsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vimLsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

return M

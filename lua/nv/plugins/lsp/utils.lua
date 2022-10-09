local wk = require "which-key"
local vimLsp = vim.lsp
local navic = require "nvim-navic"

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

--[[

TODO: check this option to setup keymapping when LSP is attached to the buffer

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set({'n', 'v'}, '<a-CR>', vim.lsp.buf.code_action, { buffer = args.buf, silent = true })
  end
})


--]]

function M.set_keymap(bufnr)
  wk.register({
    l = {
      name = "LSP",
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "search Declarations" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "search Definitions" }, -- lua vim.lsp.buf.definition()
      i = { "<cmd>Telescope lsp_implementations<cr>", "search Implementations" }, -- lua vim.lsp.buf.implementation()
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "search Type Definitions" }, -- lua vim.lsp.buf.type_definition()
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename identifier" },
      x = { "<cmd>Telescope lsp_references<cr>", "search References" }, -- lua vim.lsp.buf.references()
      q = { "<cmd>lua vim.diagnostic.open_float()<cr>", "show Diagnostics on current line" },
      n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Goto Next Diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Goto previous Diagnostic" },
      -- a = { "<cmd>Telescope lsp_code_actions<cr>", "Show Code Actions" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Show Code Actions" }, --
      f = { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>", "Format current file" },
      c = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Show Incoming calls" },
      o = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Show Outgoing calls" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show Signature Help" },
      wa = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace folder" },
      wr = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace folder" },
      wl = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "Show workspace folders" },
      ws = { '<cmd>lua R("nv.plugins.telescope").lsp_workspace_symbols()<cr>', "Show Workspace Symbols" },
      us = { '<cmd>lua R("nv.plugins.telescope").lsp_document_symbols()<cr>', "Show Document Symbols" },
      rr = {
        "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd [[e!]]<CR>",
        "Stop Clients and restart LSP",
      },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "toggle Hover on current identifier" },
  }, {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  })
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
    floating_window_above_cur_line = true,
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

  -- do not show error when LSP do not support documentSymbols
  vim.g.navic_silence = true
  navic.attach(client, bufnr)

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
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return require("cmp_nvim_lsp").update_capabilities(capabilities)
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

function M.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.formatting()
    augroup end
  ]]
  vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
  M.remove_augroup "format_on_save"
  vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

return M

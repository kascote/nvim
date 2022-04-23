local wk = require "which-key"
local vimApi = vim.api

local M = {}

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
      a = { "<cmd>Telescope lsp_code_actions<cr>", "Show Code Actions" }, -- lua vim.lsp.buf.code_action()
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format current file" },
      c = { "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Show Incoming calls" },
      o = { "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Show Outgoing calls" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show Signature Help" },
      wa = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace folder" },
      wr = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace folder" },
      wl = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "Show workspace folders" },
      ws = { '<cmd>lua R("nfx.plugins.telescope").lsp_workspace_symbols()<cr>', "Show Workspace Symbols" },
      us = { '<cmd>lua R("nfx.plugins.telescope").lsp_document_symbols()<cr>', "Show Document Symbols" },
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

  require("lsp_signature").on_attach()

  if client.name == "typescript" or client.name == "tsserver" then
    require("nfx.plugins.lsp.ts-utils").setup(client)
  end

  -- if client.resolved_capabilities.document_formatting then
  --   vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
  -- end

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  if client.resolved_capabilities.document_highlight then
    local doc_highlight = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", { group = doc_highlight, buffer = 0, callback = vim.lsp.buf.document_highlight })
    vim.api.nvim_create_autocmd("CursorMoved", { group = doc_highlight, buffer = 0, callback = vim.lsp.buf.clear_references})
  end
end

function M.disable_formatting(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

function M.capabilities()
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return require("cmp_nvim_lsp").update_capabilities(capabilities)
end

return M

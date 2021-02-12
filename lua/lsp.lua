local vim = vim
local vimApi = vim.api
local vimLsp = vim.lsp
local nvim_lsp = require('lspconfig')
local completion = require('completion')
local util = require'vim.lsp.util'
require'treesitter_setup'

local function make_on_attach(config)
  return function(client, bufnr)
    if config.before then
      config.before(client)
    end
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    completion.on_attach()
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>lT', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>lE', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
    buf_set_keymap('n', '<leader>lw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
    buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
    buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<cr>', opts)
    buf_set_keymap('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<cr>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    vimApi.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- print(vim.inspect(client.resolved_capabilities))

    if client.resolved_capabilities.document_highlight then
      vimApi.nvim_command('augroup lsp_aucmds')
      vimApi.nvim_command('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
      vimApi.nvim_command('au CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
      vimApi.nvim_command('augroup END')
    end

    -- if client.resolved_capabilities.document_symbol then
    --   vimApi.nvim_command('augroup lsp_aucmds')
    --   vimApi.nvim_command('au CursorHold <buffer> lua require("lsp-status").update_current_function()')
    --   vimApi.nvim_command('augroup END')
    -- end

    if config.after then
      config.after(client)
    end
  end
end

local servers = {
  -- solargraph = {
  --   cmd = { "solargraph", "stdio" },
  --   filetypes = { "ruby" },
  --   root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git")
  -- },
  tsserver = {},
  vimls = {},
  -- gopls = {},
  -- rust_analyzer = {},
  sumneko_lua = {
    cmd = { "/Users/fernandezn/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/macOS/lua-language-server", "-E", "/Users/fernandezn/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua" },
    install_dir = "/Users/fernandezn/.cache/nvim/nvim_lsp/sumneko_lua",
    is_installed = true
  },
  dartls = {
    cmd = { "dart", "/usr/local/Cellar/dart-beta/2.12.0-133.7.beta/libexec/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
  }
}
--  cmd = { "dart", "/usr/local/Cellar/dart/2.10.4/libexec/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },

for server, config in pairs(servers) do
  config.on_attach = make_on_attach(config)
  -- print(string.format('echom "%s"', server))
  nvim_lsp[server].setup(config)
end

-- ###########################################################################

local custom_symbol_callback = function(_, _, result, _, bufnr)
  if not result or vim.tbl_isempty(result) then return end

  local items = util.symbols_to_items(result, bufnr)
  local items_by_name = {}
  for _, item in ipairs(items) do
    items_by_name[item.text] = item
  end

  local opts = vim.fn['fzf#wrap']({
      source = vim.tbl_keys(items_by_name),
      sink = function() end,
      options = {'--prompt', 'Symbol > '},
    })
  opts.sink = function(item)
    local selected = items_by_name[item]
    vim.fn.cursor(selected.lnum, selected.col)
  end
  vim.fn['fzf#run'](opts)
end

vimLsp.callbacks['textDocument/documentSymbol'] = custom_symbol_callback
vimLsp.callbacks['workspace/symbol'] = custom_symbol_callback

-- ###########################################################################
-- how customize virtual text
-- https://gist.github.com/tjdevries/ccbe3b79bd918208f2fa8dfe15b95793
--
vimLsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vimLsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = false,
    update_in_insert = true,
  }
)

local has_lsp, lspconfig = pcall(require, 'lspconfig')
-- local _, lspconfig_util = pcall(require, 'lspconfig.util')
if not has_lsp then
  return
end

local vim = vim
local vimApi = vim.api
local vimLsp = vim.lsp
local u = require('nfx.utils')
-- local util = require'vim.lsp.util'
require'nfx.plugins.treesitter_setup'
-- vim.lsp.set_log_level("debug")

--//---------------------------------------------------------------
local set_keymap = function(bufnr)
  u.nnoremap('<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr })
  u.nnoremap('<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr })
  u.nnoremap('<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr })
  u.nnoremap('<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = bufnr })
  -- u.nnoremap('<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr })
  u.nnoremap('<leader>lr', "<cmd>lua require('lspsaga.rename').rename()<CR>", { buffer = bufnr })
  u.nnoremap('<leader>lx', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })
  u.nnoremap('<leader>lq', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { buffer = bufnr })
  -- how customize virtual text
  -- https://gist.github.com/tjdevries/ccbe3b79bd918208f2fa8dfe15b95793
  u.nnoremap('<Leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { buffer = bufnr })
  u.nnoremap('<Leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { buffer = bufnr })

  u.nnoremap('<Leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { buffer = bufnr })
  u.nnoremap('<Leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { buffer = bufnr })
  u.nnoremap('<Leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { buffer = bufnr })
  u.nnoremap('<Leader>lwg', '<cmd>lua R("nfx.plugins.telescope").lsp_workspace_diagnostics()<CR>')

  -- u.nnoremap('<leader>lw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', { buffer = bufnr })
  u.nnoremap('<Leader>lw', '<cmd>lua R("nfx.plugins.telescope").lsp_workspace_symbols()<CR>')
  -- u.nnoremap('<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', { buffer = bufnr })
  u.nnoremap('<Leader>ls', '<cmd>lua R("nfx.plugins.telescope").lsp_document_symbols()<CR>')

  u.nnoremap('<Leader>lsg', '<cmd>lua R("nfx.plugins.telescope").lsp_document_diagnostics()<CR>')

  -- u.nnoremap('<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = bufnr })
  u.nnoremap('<leader>la', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", { buffer = bufnr })
  u.nnoremap('<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', { buffer = bufnr })
  u.nnoremap('<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<cr>', { buffer = bufnr })
  u.nnoremap('<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<cr>', { buffer = bufnr })
  u.nnoremap('K',          '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
  u.nnoremap('<leader>s',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
  u.nnoremap('<leader>rr', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd [[e!]]<CR>')

  -- u.inoremap('<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
  u.inoremap('<c-s>', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { buffer = bufnr })
  u.nnoremap('<c-s>', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { buffer = bufnr })
end

--//---------------------------------------------------------------
local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
  client.config.flags.debounce_text_changes = 250
end

--//---------------------------------------------------------------
local custom_attach = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

  set_keymap(bufnr)
  require'lsp_signature'.on_attach()

  if vim.tbl_contains({"go", "rust"}, filetype) then
    vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
  end

  if client.name == "typescript" or client.name == "tsserver" then
   require("nfx.plugins.lsp.ts-utils").setup(client)
  end

  -- vimApi.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  if client.resolved_capabilities.document_highlight then
    vimApi.nvim_command('augroup lsp_document_highlight')
    vimApi.nvim_command(' autocmd! * <buffer>')
    vimApi.nvim_command(' autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
    vimApi.nvim_command(' autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
    vimApi.nvim_command('augroup END')
  end
end

local snippetsCapabilities = vim.lsp.protocol.make_client_capabilities()
snippetsCapabilities.textDocument.completion.completionItem.snippetSupport = true
snippetsCapabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

vimLsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vimLsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)


  -- lspconfig.solargraph.setup {
  --   cmd = { "solargraph", "stdio" },
  --   filetypes = { "ruby" },
  --   root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git")
  -- },

lspconfig.vimls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
}

lspconfig.gopls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true,
    }
  }
}

require('nfx.plugins.lsp.null-ls').setup()
lspconfig['null-ls'].setup {
  on_init = custom_init,
  on_attach = custom_attach,
}

lspconfig.tsserver.setup {
  -- filetypes = { "typescript", "typescriptreact" },
  -- client.resolved_capabilities.document_formatting = false
  init_options = { documentFormatting = false },
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = snippetsCapabilities
}

local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"
lspconfig.sumneko_lua.setup  {
  on_init = custom_init,
  on_attach = custom_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'dump'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          [vim.fn.expand('~/.config/nvim/lua')] = true,
        },
      },
    },
  },
}

lspconfig.dartls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  cmd = {
    "dart",
    "/usr/local/opt/dart/libexec/bin/snapshots/analysis_server.dart.snapshot",
    "--lsp"
  },
}

-- local lsp_js_setup = {
--   lintCommand = "npx eslint -f visualstudio --stdin --stdin-filename ${INPUT}",
--   lintIgnoreExitCode = true,
--   lintStdin = true,
--   lintFormats = { "%f(%l,%c): %m" },
--   xxlintFormats = {
--     "%f(%l,%c): %tarning %m",
--     "%f(%l,%c): %rror %m",
--   },
--   no_formatCommand = 'npx eslint -f visualstudio --fix-dry-run --stdin --stdin-filename=${INPUT}',
--   formatCommand = 'npx prettier --stdin-filepath=${INPUT}',
--   formatStdin = true,
-- }

-- lspconfig.efm.setup {
--   on_init = custom_init,
--   on_attach = custom_attach,
--   init_options = { documentFormatting = true },
--   filetypes = { "javascript", "javascriptreact", "lua", "typescript", "typescriptreact" },
--   settings = {
--       rootMarkers = { ".git/" },
--       nolintDebounce = '1s',
--       languages = {
--         javascript = { lsp_js_setup },
--         javascriptreact = { lsp_js_setup },
--         typescript = { lsp_js_setup },
--         typescriptreact = { lsp_js_setup },
--         lua = {
--           {
--             formatCommand = 'stylua --config-path /Users/fernandezn/.config/stylua/stylua.toml -',
--             formatStdin = true,
--           }
--         }
--       }
--   },
-- }

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.cmd('hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646')
vim.cmd('hi LspReferenceText cterm=bold ctermbg=red guibg=#164646')
vim.cmd('hi LspReferenceWrite cterm=bold ctermbg=red guibg=#964646')

-- vim.lsp.handlers["textDocument/hover"] = require('lspsaga.hover').handler
-- vim.lsp.diagnostic.show_line_diagnostics = require('lspsaga.diagnostic').show_line_diagnostics

-- ###########################################################################
--[[
-- some interesting ideas for lsp config
  https://github.com/ssoriche/dotfiles/blob/neovim_lsp/neovim/lua/lsp/init.lua

  https://github.com/disrupted/dotfiles/blob/master/.config/nvim/lua/conf/lsp.lua

  https://github.com/MagicDuck/dotfiles
--]]

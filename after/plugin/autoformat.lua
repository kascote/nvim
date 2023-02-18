-- borrowed from https://github.com/nvim-lua/kickstart.nvim/blob/2eada65d5231a14765a257078b102984529a6f63/after/plugin/autoformat.lua

local enable_autoformat = true
if not enable_autoformat then
  return
end

-- Switch for controlling whether you want autoformatting.
--  Use :NfxFormatToggle to toggle autoformatting on or off
local enabled = true
vim.api.nvim_create_user_command("NfxFormatToggle", function()
  enabled = not enabled
  vim.notify("Setting autoformatting to: " .. tostring(enabled))
end, {})

-- Create an augroup that is used for managing our formatting autocmds.
--      We need one augroup per client to make sure that multiple clients
--      can attach to the same buffer without interfering with each other.
local _augroups = {}
local get_augroup = function(client)
  if not _augroups[client.id] then
    local group_name = "nfx-lsp-format-" .. client.name
    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
    _augroups[client.id] = id
  end

  return _augroups[client.id]
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("nfx-lsp-attach-format", { clear = true }),

  -- This is where we attach the autoformatting for reasonable clients
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    local bufnr = args.buf

    -- Only attach to clients that support document formatting
    if not client.server_capabilities.documentFormattingProvider then
      return
    end

    -- Tsserver usually works poorly.
    if client.name == "tsserver" then
      return
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = get_augroup(client),
      buffer = bufnr,
      callback = function()
        if not enabled then
          return
        end

        vim.lsp.buf.format { async = false }
      end,
    })
  end,
})

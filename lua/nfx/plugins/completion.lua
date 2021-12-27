local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      -- require('luasnip').lsp_expand(args.body)
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  -- can configure:
  -- keyword_length
  -- priority
  -- max_item_count
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "vsnip" },
    -- { name = 'luasnip' },
    -- { name = 'ultisnips' },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        vsnip = "[vsnip]",
      },
    },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

-- cmp.setup.cmdline(":", {
--   completion = {
--     autocomplete = true,
--   },

--   sources = cmp.config.sources({
--     {
--       name = "path",
--     },
--   }, {
--     {
--       name = "cmdline",
--       max_item_count = 20,
--       keyword_length = 4,
--     },
--   }),
-- })

-- cmp.setup.cmdline("/", {
--   completion = {
--     -- Might allow this later, but I don't like it right now really.
--     -- Although, perhaps if it just triggers w/ @ then we could.
--     --
--     -- I will have to come back to this.
--     autocomplete = false,
--   },
--   sources = cmp.config.sources({
--     { name = "nvim_lsp_document_symbol" },
--   }, {
--     -- { name = "buffer", keyword_length = 5 },
--   }),
-- })

vim.g.vsnip_snippet_dir = vim.fn.stdpath "config" .. "/mysnips"

vim.g.vsnip_filetypes = {
  javascriptreact = { "javascript" },
  typescriptreact = { "typescript" },
}

local cmp = require "cmp"

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
    { name = "buffer", keyword_length = 5 },
    { name = "path" },
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  }
  -- formatting = {
  --   format = lsp
  -- }
}

vim.g.vsnip_snippet_dir = vim.fn.stdpath "config" .. "/mysnips"

vim.g.vsnip_filetypes = {
  javascriptreact = { "javascript" },
  typescriptreact = { "typescript" },
}

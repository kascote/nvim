-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local nfxPrg = vim.api.nvim_create_augroup("nfxPrg", { clear = true })
vim.api.nvim_create_autocmd("VimResized", { command = [[execute "normal! \<c-w>="]], group = nfxPrg, pattern = "*" })

vim.api.nvim_create_autocmd(
  { "BufEnter", "InsertLeave", "VimEnter", "WinEnter" },
  { command = "setlocal cursorline", group = nfxPrg, pattern = "*" }
)

vim.api.nvim_create_autocmd(
  { "BufLeave", "InsertEnter", "WinLeave" },
  { command = "setlocal nocursorline", group = nfxPrg, pattern = "*" }
)

local goToLastEdit = function()
  if vim.fn.line "'\"" > 0 and vim.fn.line "'\"" <= vim.fn.line "$" then
    vim.cmd [[normal! g'"]]
  end
end

vim.api.nvim_create_autocmd({ "BufReadPost" }, { callback = goToLastEdit, group = nfxPrg, pattern = "*" })

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local luaHighlight = vim.api.nvim_create_augroup("LuaHighlight", { clear = true })
vim.api.nvim_create_autocmd(
  "TextYankPost",
  { command = [[lua require'vim.highlight'.on_yank()]], group = luaHighlight, pattern = "*" }
)

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local ft_js = vim.api.nvim_create_augroup("ft_javascript", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufNewFile,BufRead" },
  { command = [[syn match Error /\<console\>/]], group = ft_js, pattern = "*.js" }
)

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local ft_jsx = vim.api.nvim_create_augroup("ft_javascriptreact", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufNewFile,BufRead" },
  { command = [[syn match Error /\<console\>/]], group = ft_jsx, pattern = "*.jsx" }
)

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

local ft_ruby = vim.api.nvim_create_augroup("ft_ruby", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufNewFile,BufRead" },
  { command = [[syn match Error /\<binding\.pry\>/]], group = ft_ruby, pattern = "*.rb" }
)
vim.api.nvim_create_autocmd(
  { "BufNewFile,BufRead" },
  { command = [[syn match Error /\<byebug\>/]], group = ft_ruby, pattern = "*.rb" }
)
vim.api.nvim_create_autocmd(
  { "BufNewFile,BufRead" },
  { command = [[syn match Error /\<debugger\>/]], group = ft_ruby, pattern = "*.rb" }
)

-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }, {
  callback = function()
    require("nfx.plugins.winbar").get_winbar()
  end,
})


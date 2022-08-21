local vapi = vim.api

local vimNavigate = function(direction)
  vim.cmd("wincmd " .. direction)
end

local kittyNavigate = function(direction)
  P('kitty @ kitten neighboring_window.py ' .. direction)
  vim.fn.system('kitty @ kitten neighboring_window.py ' .. direction)
end

local innerHandler = {
  left = function() vimNavigate "h" end,
  down = function() vimNavigate "j" end,
  up = function() vimNavigate "k" end,
  right = function() vimNavigate "l" end,
}

local outerHander = {
  left = function() kittyNavigate "left" end,
  down = function() kittyNavigate "bottom" end,
  up = function() kittyNavigate "top" end,
  right = function() kittyNavigate "right" end,
}

local navigator = function(direction)
  local currentWin = vim.api.nvim_win_get_number(0)
  innerHandler[direction]()
  if (currentWin == vim.api.nvim_win_get_number(0)) then
    outerHander[direction]()
  end
end


vapi.nvim_create_user_command("VNavLeft", function () navigator('left') end, { nargs = 0 })
vapi.nvim_create_user_command("VNavUp", function () navigator('up') end, { nargs = 0 })
vapi.nvim_create_user_command("VNavDown", function () navigator('down') end, { nargs = 0 })
vapi.nvim_create_user_command("VNavRight", function () navigator('right') end, { nargs = 0 })

local m = {
  default_key = 'wmark',
  current_index = 1,
  priority = 10,
  patterns = {},
  default_colors = {
    'guifg=#000000 guibg=#ffffaa',
    'guifg=#000000 guibg=#aaffaa',
    'guifg=#000000 guibg=#55aaff',
    'guifg=#000000 guibg=#ffaaaa',
  },
  key_maps = {
    ['<leader>i'] = 'add',
    ['<leader>I'] = 'reset',
    ['<leader>t'] = 'add_range',
  }
}

local _metachar = [[\/~ .*^[''$]]

--- Setup the highlights
---@param colors table: list of colors to define hightlights
function m.init_hightlight(colors)
  colors = colors or m.default_colors
  for n, value in ipairs(colors) do
    vim.cmd('highlight default ' .. m.default_key .. n .. ' ' .. value)
  end
end

--- Add a new pattern to the list
---@param pattern string: pattern to add
function m.add(pattern)
  local idx = m.current_index % #m.default_colors
  if idx == 0 then 
    idx = #m.default_colors
  end
  local hiGroup = m.default_key .. idx
  P(m.escape(pattern))
  m.patterns[pattern] = vim.fn.matchadd(hiGroup, pattern, m.priority)
  m.current_index = m.current_index + 1
end

--- Remove a pattern from the list
---@param pattern string: pattern to remove
function m.del(pattern)
  vim.fn.matchdelete(m.patterns[pattern])
  m.patterns[pattern] = nil
end

--- Setup the keymap
---@param keymap table: table with the keymap
function m.set_keymap(keymap)
  keymap = keymap or m.key_maps
  for k, f in pairs(keymap) do
    if f == 'add_range' then
      vim.cmd("vnoremap <silent> "..k.." <cmd>lua require'wmark'."..f.."()<cr>")
    else 
      vim.cmd("nnoremap <silent> "..k.." <cmd>lua require'wmark'."..f.."()<cr>")
    end
  end
end

function m.escape(pattern)
  return vim.fn.escape(pattern, _metachar)
end

function m.get_sel_range()
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  -- if csrow < cerow or (csrow == cerow and cscol <= cecol) then
  --   return csrow - 1, cscol - 1, cerow - 1, cecol
  -- else
  --   return cerow - 1, cecol - 1, csrow - 1, cscol
  -- end 
  return cerow, csrow, cecol, cscol
end

return m

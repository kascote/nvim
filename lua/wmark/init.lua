local wmark = {}
local m = require'wmark.mark'

--- Set default colors to use for marks
---@param opts table: Config options, colors, keys, etc.
function wmark.default_colors(opts)
  wmark.colors = opts.colors or m.default_colors
end

--- Initialize `wmark` with default values
---@param opts table: Config options, colors, keys, etc.
function wmark.setup(opts)
  opts = opts or {}
  wmark.default_colors(opts)
  m.init_hightlight(opts.colors)
  m.set_keymap(opts.keymap)
end

--- Add the current text under the cursor as a new mark. 
--- If the mark already exists, will be removed
function wmark.add()
  local pattern = vim.fn.expand('<cword>')
  if not pattern then 
    return
  end
  wmark._toggle(pattern)
end

function wmark.add_range()
  -- print(m.get_sel_range())
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  print('--', cerow, csrow, cecol, cscol)
end

--- Remove a mark represented by the text under the cursor.
function wmark.del()
  local pattern = vim.fn.expand('<cword>')
  if not pattern then 
    return
  end
  if (m.patterns[pattern]) then
    m.del(pattern)
  end
end

--- Remove all marks
function wmark.reset()
  for p in pairs(m.patterns) do
    m.del(p)
  end
end

function wmark._toggle(pattern)
  if (m.patterns[pattern]) then
    m.del(pattern)
  else
    m.add(pattern)
  end
end

vim.cmd [[nnoremap <C-l> <cmd>lua vim.fn.clearmatches() R('wmark.mark') R('wmark').setup()<cr>]]

return wmark


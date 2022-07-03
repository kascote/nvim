
local utils = {}

local _line_numbers_sequence = {
  ['00'] = 'set relativenumber   | set number',
  ['01'] = 'set norelativenumber | set number',
  ['10'] = 'set norelativenumber | set nonumber',
  ['11'] = 'set norelativenumber | set number'
}

utils.remap = function(mode, key, cmd, options)
  local opts = vim.tbl_extend('force', { silent = true, noremap = true } , options or {})
  if opts.buffer then
    local bufnr = opts.buffer
    opts.buffer = nil
    vim.api.nvim_buf_set_keymap(bufnr, mode, utils.termcodes(key), cmd, opts)
  else
    --vim.api.nvim_set_keymap(mode, utils.termcodes(key), cmd, opts)
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
  end
end

utils.termcodes = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

utils.cycle_line_numbers = function()
  local _number = vim.wo.number and '1' or '0'
  local _relative = vim.wo.relativenumber and '1' or '0'
  local _exec = _line_numbers_sequence[_number .. _relative]
  vim.fn.execute(_exec, true)
end

utils.execute_preserve_cursor = function(command)
  local save = vim.fn.winsaveview()
  vim.fn.execute(command)
  vim.fn.winrestview(save)
end

utils.trim_white_spaces = function()
  utils.execute_preserve_cursor('%s/\\s\\+$//e')
end

utils.adjust_file_indent = function()
  utils.execute_preserve_cursor('normal gg=G')
end

utils.syn_stack = function()
  local items = vim.fn.synstack(vim.fn.line('.'), vim.fn.col('.'))
  if (#items == 0) then
    print('no items found')
    return
  end
  for _, i1 in pairs(items) do
    local i2 = vim.fn.synIDtrans(i1)
    local n1 = vim.fn.synIDattr(i1, "name")
    local n2 = vim.fn.synIDattr(i2, "name")
    print( n1 .. "->" .. n2)
  end
end

--[[
" Map execute this line
function! s:executor() abort
  if &ft == 'lua'
    call execute(printf(":lua %s", getline(".")))
  elseif &ft == 'vim'
    exe getline(">")
  endif
endfunction
nnoremap <leader>x :call <SID>executor()<CR>
--]]

--[[
" Execute this file
function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif

  return
endfunction
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>
--]]

utils.try_suffixes = function (base)
  for _, ext in ipairs(vim.fn.split(vim.bo.suffixesadd, ',')) do
    local file = base .. ext

    if vim.fn.filereadable(file) == 1 then
      vim.cmd(string.format("%s %s", 'edit', file))
      return true
    end
  end
  return false
end

utils.includeexpr_js = function()
  local fname = vim.fn.matchstr(vim.fn.getline('.'), vim.bo.include)
  local base  = vim.fn.simplify(vim.fn.expand('%:h') .. '/' .. fname)
  local ext  = vim.fn.fnamemodify(base, ':e')

  -- fname can be blank because the 'include' expresion do not detect
  -- multi line imports
  if (ext ~= "" or fname == "") then
    vim.cmd("normal! gf")
    return
  end

  if vim.fn.isdirectory(base) == 1 then
    if utils.try_suffixes(base .. '/index') then return end
  end

  if utils.try_suffixes(base) then return end
  vim.cmd("normal! gf")
end


return utils

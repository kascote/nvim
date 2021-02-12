
function nfx#tabline#render()
  let s = ''
  let label = '%#TabLineModNone#' . ' •'
  let current_modified = ''


  let current_buffer = getbufinfo('%')[0]

  if current_buffer.changed == v:true
    let current_modified = '%#TabLineModBuf#' . ' •'
  end

  " get all the buffer and check if some has the modified flag
  if count(map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.changed'), 1)
    let label = '%#TabLineMod#' . ' •'
  end

  let label .= nfx#tabline#label(' . (i + 1) . ')
  let label .= current_modified


  " for i in range(tabpagenr('$'))
  "   " select the highlighting
  "   if i + 1 == tabpagenr()
  "     let s .= '%#TabLineSel#'
  "   else
  "     let s .= '%#TabLine#'
  "   endif
  "
  "   " set the tab page number (for mouse clicks)
  "   let s .= '%' . (i + 1) . 'T'
  "
  "   if getbufinfo(i + 1)[0].changed
  "     let some_modified = '%#TabLineMod#' . ' ●'
  "   end
  "
  "   " the label is made by MyTabLabel()
  "   " let s .= ' %{nfx#tabline#label(' . (i + 1) . ')} '
  "   let s .= nfx#tabline#label(' . (i + 1) . ')
  " endfor
  "
  " let label .= some_modified . s . current_modified
  "
  "
  " " after the last tab fill with TabLineFill and reset tab page nr
  " let label .= '%#TabLineFill#%T'
  "
  " " right-align the label to close the current tab page
  " " if tabpagenr('$') > 1
  " "   let s .= '%=%#TabLine#%999Xclose'
  " " endif

  return label
endfunction

function nfx#tabline#label(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bname = bufname(buflist[winnr - 1])
  let basepath = fnamemodify(bname, ":p:~:.:h")
  let basename = fnamemodify(bname, ":p:t")
  if bname == ''
    let label = ' %#TabLine#(empty) '
  else
    let label = ' %#TabLine#' . basepath . '/' . '%#TabLineSel#' . basename . " %*"
  endif
  return label
endfunction

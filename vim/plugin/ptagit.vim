" 調用:ptag命令預覽光標所在<word>的定義
" 對類C語言風格的函數/方法定義和注釋有效，對其餘情況仍沿用:ptag的原有效果
function! PTagIt()
  exec "ptag ".expand("<cword>")
  let cwin = winnr()
  silent! wincmd P
  let lnr = line('.')
  if lnr < 3
    return
  endif

  if foldlevel('.')>0
    normal zo
  endif

  let chead = 0
  let linestr = getline(lnr-1)
  if linestr =~ '^\s*\*/'
    let ptr = lnr-2
    while ptr>0
      let linestr = getline(ptr)
      if linestr =~ '^\s*/\*'
        let chead = ptr
        break
      endif
      let ptr = ptr-1
    endwhile
  endif

  if chead>0
    exec 'resize '.(lnr-chead+1)
    exec 'normal '.chead."z\<CR>"
    exec 'normal '.lnr.'G'
  endif

  exec cwin.'wincmd w'  
endfunction
nmap <leader>pp :call PTagIt()<CR>
nmap <leader>pc :pclose<CR>

au! CursorHold *.[ch] nested call PreviewWord()
func PreviewWord()
  if &previewwindow			" don't do this in the preview window
    return
  endif
  let w = expand("<cword>")		" get the word under cursor
  if w =~ '\a'			" if the word contains a letter

    " Delete any existing highlight before showing another tag
    silent! wincmd P			" jump to preview window
    if &previewwindow			" if we really get there...
      match none			" delete existing highlight
      wincmd p			" back to old window
    endif

    " Try displaying a matching tag for the word under the cursor
    try
      exe "ptag " . w
    catch
      return
    endtry

    silent! wincmd P			" jump to preview window
    if &previewwindow		" if we really get there...
      if has("folding")
        silent! .foldopen		" don't want a closed fold
      endif
      call search("$", "b")		" to end of previous line
      let w = substitute(w, '\\', '\\\\', "")
      call search('\<\V' . w . '\>')	" position cursor on match
      " Add a match highlight to the word at this position
      hi previewWord term=bold ctermbg=green guibg=green
      exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
      wincmd p			" back to old window
    endif
  endif
endfun

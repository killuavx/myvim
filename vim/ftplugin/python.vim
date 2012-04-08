autocmd FileType python setl fdm=syntax | setl fen 

setlocal tabstop=2 "空格数量为4
setlocal shiftwidth=2 "自动缩进为4
"setlocal expandtab "使用空格代替Tab
setlocal smarttab

set foldmethod=indent
set foldexpr=2

"autocmd FileType php setl fdm=syntax | setl fen 
"autocmd FileType php set omnifunc=phpcomplete
"setlocal foldmethod=expr
"setlocal foldexpr=GetPythonFold(v:lnum)
"setlocal foldtext=PythonFoldText()
let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 10
set complete+=k~/.vim/ftplugin/pydiction
"set omnifunc=pythoncomplete#Complete

set ofu=syntaxcomplete#Complete
"runtime! $HOME/.vim/autoload/pythoncomplete.vim
map <F4> <ESC>:w<CR>:!pylint %

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
"let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"let g:pep8_map='whatever'
let g:pep8_map='<leader>8'

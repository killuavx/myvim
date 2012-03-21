autocmd FileType python setl fdm=syntax | setl fen 

setlocal tabstop=4 "空格数量为4
setlocal shiftwidth=4 "自动缩进为4
setlocal expandtab "使用空格代替Tab
setlocal smarttab

"set foldmethod=indnet

"autocmd FileType php setl fdm=syntax | setl fen 
"autocmd FileType php set omnifunc=phpcomplete
"setlocal foldmethod=expr
"setlocal foldexpr=GetPythonFold(v:lnum)
"setlocal foldtext=PythonFoldText()
let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 20

set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python runtime! $HOME/.vim/autoload/pythoncomplete.vim
autocmd FileType python map <F4> <ESC>:w<CR>:!pylint %

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:pep8_map='whatever'
"let g:pep8_map='<leader>8'

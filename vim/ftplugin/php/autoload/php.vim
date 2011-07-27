autocmd BufNewFile,Bufread *.inc,*.php set keywordprg="help"

"exec 'set runtimepath+=~/.vim/ftplugin/php'
let php_folding=1
autocmd FileType php setl fdm=syntax | setl fen 
autocmd FileType php set omnifunc=phpcomplete

"PHP语法检查 
"map <F4> :!php-cgi -l %<CR> 
function! CheckPHPSyntax() 
    setlocal makeprg=php-cgi\ -l\ -n\ -d\ html_errors=off 
    setlocal shellpipe=> 
    " Use error format for parsing PHP error output 
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l 
    make % 
endfunction 
" Perform :PHP_CheckSyntax() 
map <F4> <Esc>:call CheckPHPSyntax()<CR> 


"vim + xdebug + debugger 
"vim port设置
let g:debuggerPort=9001
let g:debuggerMaxDepth=3

" for PHP ctags
"set tags+=$HOME/.vim/ftplugin/php/doc"

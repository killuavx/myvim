autocmd FileType php setl fdm=syntax | setl fen 
set complete+=k~/.vim/ftplugin/php/doc/php-manual/ "add dictionary complete
set runtimepath+=$HOME/.vim/ftplugin/php/doc/php-manual
set tags+=$HOME/.vim/ftplugin/php/doc/php-manual
set tags+=$HOME/.vim/ftplugin/php/doc/php-manual/tags
"autocmd FileType php set dictionary=~/.vim/ftplugin/php/doc/php-manual/
"autocmd FileType php set keywordprg=:help 
"autocmd FileType php set omnifunc=syntaxcomplete
"autocmd FileType php set omnifunc=phpcomplete
:so $HOME/.vim/ftplugin/php/plugin/debugger.vim
:so $HOME/.vim/ftplugin/php/plugin/phpcs.vim
map <F4> <Esc>:call CheckPHPSyntax()<CR> 
" for PHP ctags
"
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

"vim + xdebug + debugger 
"vim port设置
let g:debuggerPort=9001
let g:debuggerMaxDepth=3
map <M-b> <Esc>:Bp<CR>

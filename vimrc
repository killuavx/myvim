set showcmd
"
"语法高亮
syntax on

"检测文件类型
filetype on 
"检查文件类型 载入对应的ftplugin vim脚本
filetype indent on
filetype plugin on

set number
set autoindent

set tabstop=2 "空格数量为4
set shiftwidth=2 "自动缩进为4
"set softtabstop=2
set expandtab "使用空格代替Tab
"设置匹配模式， 类似当输入一个左括号时匹配右括号
set showmatch
"智能对齐方式 
set smartindent

"Add more information on status bar
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
"Always show the status line
set laststatus=2

" case insensitive search
set ignorecase
set smartcase

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"去除vim的GUI版本中的toolbar
set guioptions-=T

"高亮搜索
set hlsearch

set incsearch

"修改后，自动备份，~结尾文件
"if has('vms')
"set nobackup
"else
"set backup
"endif
"nobackup
set nobackup
set nowritebackup


"不自动换行 
set nowrap 
"设置超过120字符自动换行 
"set textwidth=120 
"设置超过100列的字符带下划线 
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>120v.\+', -1) 
"syn match out80 /\%80v./ containedin=ALL 
"hi out80 guifg=white guibg=red 

" for LoadTemplate
"let g:template_path='~/.vim/template/'

" 设置折叠模式 
"========================================
set foldenable
set foldcolumn=2 
"光标遇到折叠，折叠就打开 
"set foldopen=all 
"移开折叠时自动关闭折叠 
"set foldclose=all 
"zf zo zc zd zr zm zR zM zn zi zN 
"依缩进折叠 
"   manual  手工定义折叠 
"   indent  更多的缩进表示更高级别的折叠 
"   expr    用表达式来定义折叠 
"   syntax  用语法高亮来定义折叠 
"   diff    对没有更改的文本进行折叠 
"   marker  对文中的标志折叠 
"set foldmethod=syntax 
"启动时不要自动折叠代码 
set foldlevel=1 
"依标记折叠 
set foldmethod=marker 

"=======================================
" 折叠模式结束


" User defined
" ================
" for chinese encode
set encoding=UTF-8
set termencoding=UTF-8
language message zh_CN.utf-8 "解决终端乱码
set fileencodings=utf-8,gbk,big5,latin1
set fileencoding=utf-8
source $VIMRUNTIME/delmenu.vim    
source $VIMRUNTIME/menu.vim
"=================


" for guifont
" 针对Windows的字体配置
"set guifont=Courier\ New:h10:cANSI
au GUIEnter * simalt ~x "最大化窗口

set guifont=Monaco\ 9


"标签页只显示文件名
function! ShortTabLabel ()
  let bufnrlist = tabpagebuflist (v:lnum)
  let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
  let filename = fnamemodify (label, ':t')
  return filename
endfunction

set guitablabel=%{ShortTabLabel()}


"Change work dir to current dir
"移动工作目录到当前目录
autocmd BufEnter * cd %:p:h


" shift tab pages
" 映射标签前后移动键
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>


"F7单独切换打开nerd_tree（nerd_tree插件） 
let g:NERDChristmasTree = 1              "色彩显示 
"let g:NERDTreeShowHidden = 1             "显示隐藏文件 
let g:NERDTreeWinPos = 'left'            "窗口显示位置 
let g:NERDTreeHighlightCursorline = 1    "高亮当前行 
"let NERDTreeShowBookmarks=1
let NERDTreeWinPos='right'
"au VimEnter *  NERDTree " 自动打开 NERDTree
"nmap <F7>  :TrinityToggleNERDTree<CR> 



"设置命令行的高度 
set cmdheight=3 

"行高亮 
set cursorline 
"列高亮，与函数列表有冲突 
"set cursorcolumn 

"显示中文引号 
set ambiwidth=double


""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 

" For showmarks plugin
hi ShowMarksHLl ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
hi ShowMarksHLu ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black 


" for taglist
" =================
let Tlist_Show_One_File=1 "taglist plugin show local tagfile only
"let Tlist_Use_Right_Window=1 "show right
let Tlist_Exit_OnlyWindw=1 
"让当前不被编辑的文件的方法列表自动折叠起来 
let Tlist_File_Fold_Auto_Close=1 

"let Tlist_Auto_Open=1
let Tlist_Auto_Update=1


""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWidth = 30
let g:defaultExplorer = 0
let g:winManagerWindowLayout='TagList|BufExplorer'
let g:miniBufExplMapCTabSwitchBufs=1
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <F8> :WMToggle<cr>
nmap <silent> <F8> :WMToggle<cr>




"colo tir_black
"colo impact
"colo lucius
"colo xoria256

lef loaded_nerd_comments=1


" 查看 svn diff，flw 很得意的创意
function! FlwSvnDiffToggle()
  if bufexists( "__SVN_DIFF__" )
    bwipeout __SVN_DIFF__
  else
    if exists("t:flwsvndiff")
      diffoff!
      let l:fileName = t:flwsvndiff
      unlet t:flwsvndiff
      exec "bwipeout " . l:fileName           
    else
      let t:flwsvndiff = expand("%:h") . "/.svn/text-base/" . expand("%:t") . ".svn-base"
      let l:ft = &ft
      exec "silent vert diffsplit " . t:flwsvndiff
      set readonly
      set buftype=nofile
      exec "set ft=" . l:ft
      wincmd p
      autocmd VimResized * :wincmd =
    endif
  endif
endfunction
"F7 察看svn版本比较
nmap <silent> <c-F7> :call FlwSvnDiffToggle()<CR>
nmap <silent> g<c-F7> :new __SVN_DIFF__ <CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg


filetype plugin indent on


let g:use_zen_complete_tag=1


nnoremap <expr> gh '<Esc>' . float2nr( round( (col('$')-1) * min([100, v:count]) / 100.0)) . '<Bar>'
nmap gch 50gh 

"比较未保存文件的差异
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

"在终端和gui下使用鼠标
set mouse=a

"显示尾行标示
set list
"显示尾行空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"highlight  DiffAreaOurs  ctermbg=red guibg=red
"match DiffAreaOurs /^<\+ HEAD/

"highlight link DiffAreaTheirs DiffAdd 
"match DiffAreaTheirs /^=\{4,\}\(\_.\)*>\{4,\}/

"highlight link DiffAreaMarker DiffDelete
"match DiffAreaMarker /^\(?<=\(\[><\]\)\) \(.\)*/
"highlight Folded term=standout cterm=standout ctermfg=NONE ctermbg=NONE gui=bold guifg=NONE guibg=NONE

nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>ft :FufTag<CR>

"au VimEnter * NERDTree " 自动打开 NERDTreeShowHidden
"au VimEnter * WMToggle " 自动打开 winManager
"au VimEnter * wincmd p
"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

au BufRead,BufNewFile /etc/nginx/* set ft=nginx

let php_folding=1
autocmd FileType php setl fdm=syntax | setl fen 
let g:debuggerPort=9001

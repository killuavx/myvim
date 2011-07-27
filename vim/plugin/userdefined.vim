"批量添加文件到缓存区，并打开列表第一个文件
function! BufMultiAdd( ... )
    if a:0 < 1
        echo "Pleace input more than one file"
        return;
    endif
    let cnt=1
    while cnt <= a:0
        :badd a:{cnt}
        cnt++
    endwhile

    :edit a:{cnt}
    echo cnt . " Files have been added in buffers."  
endfunction


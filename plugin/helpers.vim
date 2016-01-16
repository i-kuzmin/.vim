"Insert empty line
" 1 - before current
" 2 - after current
" 3 - before and after current
function! helpers#InsertEmptyLine(i)
    let l:col = col('.')
    let l:line = line('.')

    if a:i == 3
        call helpers#InsertEmptyLine(1)
        call helpers#InsertEmptyLine(2)
        return
    endif

    set paste
    if a:i == 1
        normal O
        let l:line += 1
    elseif a:i == 2
        normal o
    endif
    set nopaste
    call cursor(l:line, l:col)
endfunction

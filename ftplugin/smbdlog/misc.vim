" Find the file (and line number) at a specific lnum
" Returns list first element is file path, second is
" line num
function! FindFile(lnum)
    let current = a:lnum
    let contents = getline(current)
    if IsLogHeader(contents) <= 0
        let current = FindPreviousLogHeader(current)
        " update contents with header
        let contents = getline(current)
    endif
    let full = split(split(contents)[-1],'(')[0]
    return split(full, ':')
endfunction

setlocal foldmethod=expr
setlocal foldexpr=GetFoldLevel(v:lnum)

:nnoremap <leader>

function! FindPreviousLogHeader(lnum)
    let old = a:lnum
    let current = a:lnum - 1
    while current >= 0
        if IsLogHeader(getline(current))
            return current
        endif
        let current -= 1
    endwhile
endfunction

" Check if line is a header
" basically if this is samab log file
" if the line starts with a space the content belongs
" to the previous debug log header e.g.
" [2019/04/30 01:24:42.741907,  5, pid=793830, effective(0, 0)....
" We do very minimal sanity checking here just verifying if the
" line doesn't start with a space that it starts with '['
function! IsLogHeader(contents)
    if strpart(a:contents, 0, 1) == " "
        return 0
    endif
    let pieces = split(a:contents, ",")
    if strpart(pieces[0], 0, 1) == "["
        return 1
    endif
    return -1
endfunction

function! GetFoldLevel(lnum)
    let contents = getline(a:lnum)
"    Use the debug level as the folding level, if we split the header
"    content with comma as the delimter we get a list of elements of
"    which the 2nd is *always* the debug level
    if IsLogHeader(contents)
       return str2nr(split(contents, ",")[1])
    endif
"   if the line isn't a log header then the content is associated with
"   the previous log header
    let prev = FindPreviousLogHeader(a:lnum)
    if prev >= 1
        let contents = getline(prev)
        return str2nr(split(contents, ",")[1])
    endif
    return '-1'
endfunction

function! GetCurrentBufferFoldLevel()
    return &l:foldlevel
endfunction

function! IncBufferFoldLevel()
    let current = GetCurrentBufferFoldLevel()
    if current < 10
        set local foldlevel = current + 1
endfunction

function! DecBufferFoldLevel()
    let current = GetCurrentBufferFoldLevel()
    if current > 0
        set local foldlevel = current - 1
endfunction

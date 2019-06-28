" opens file in split window at debug line
:nnoremap <leader><cr> :call OpenFile(line("."))<cr>

" allows samba source dir to be redifined
:nnoremap <leader>r :call ResetSambaSource()<cr>

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

function! ResetSambaSource()
    call inputsave()
    let g:smblog_src_dir = input('Enter path to samba source: ')
    call inputrestore()
endfunction

function! OpenFile(lnum)
    let temp = FindFile(a:lnum)
    let filenum = temp[1]
    let filename = temp[0]
    if !exists("g:smblog_src_dir")
        call ResetSambaSource()
    endif
    let fullpath = g:smblog_src_dir . '/bin/' . filename
    execute("sp +" . filenum . " " . fullpath)
endfunction

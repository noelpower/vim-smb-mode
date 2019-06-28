if exists("b:current_syntax")
    finish
endif

syntax keyword logKeyword pid status address
syntax match logKeyword "\vNT_STATUS_[A-Z]+"

" Needs to work just for lines starting with '['
" my regrex foo is not strong enough
syntax match logFunction "\v\(([^()]*)\)$"
syntax match logFileName "\v( \.\..*:[1-9]+)"

highlight link logKeyword Keyword
highlight link logFunction Function
highlight link logFileName Comment

let b:current_syntax = "smbdlog"

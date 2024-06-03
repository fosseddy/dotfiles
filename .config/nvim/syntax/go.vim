if exists("b:current_syntax")
    finish
endif

let s:keepcpo = &cpo
set cpo&vim

syn sync fromstart

syn match go_comment "\/\/.*"
syn region go_comment start="/\*" end="\*/"
syn region go_string start=+\z(['"`]\)+ skip="\\\z1" end="\z1"

hi def link go_comment Comment
hi def link go_string String

let b:current_syntax = "go"
let &cpo = s:keepcpo
unlet s:keepcpo

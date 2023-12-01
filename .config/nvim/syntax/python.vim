if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn sync minlines=500

syn match python_comment "#.*"
syn region python_string start=+\z(['"]\)+ skip="\\\z1" end="\z1"
syn region python_string start=+\z('''\|"""\)+ skip=+\\["']+ end="\z1"

hi def link python_comment Comment
hi def link python_string String

let b:current_syntax = "python"
let &cpo = s:cpo_save
unlet s:cpo_save

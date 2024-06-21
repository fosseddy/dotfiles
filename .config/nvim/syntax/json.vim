if exists("b:current_syntax")
    finish
endif

if !exists("main_syntax")
    let main_syntax = "json"
endif

let s:cpo_save = &cpo
set cpo&vim

if main_syntax == "json"
    syn sync fromstart
endif

syn region json_string start=+"+ skip=+\\"+ end=+"+

syn match json_comment "\/\/.*"
syn region json_comment start="/\*" end="\*/"

hi def link json_string String
hi def link json_comment Comment

let b:current_syntax = "json"
if main_syntax == "json"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

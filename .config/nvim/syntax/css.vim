if exists("b:current_syntax")
    finish
endif

if !exists("main_syntax")
    let main_syntax = "css"
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

if main_syntax == "css"
    syn sync minlines=500
endif

syn region css_comment start="/\*" end="\*/"
syn region css_string start=+\z(['"]\)+ skip="\\\z1" end="\z1"

hi def link css_comment Comment
hi def link css_string String

let b:current_syntax = "css"
if main_syntax == "css"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

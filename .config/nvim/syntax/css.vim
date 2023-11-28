if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = "css"
elseif exists("b:current_syntax") && b:current_syntax == "css"
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

if main_syntax == "css"
    syn sync minlines=500
endif

syn region css_comment start="/\*" end="\*/"
syn region css_string start=+"+ skip=+\\"+ end=+"+
syn region css_string start="'" skip="\\'" end="'"

hi def link css_comment Comment
hi def link css_string String

let b:current_syntax = "css"
if main_syntax == "css"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

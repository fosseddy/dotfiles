if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = "javascript"
elseif exists("b:current_syntax") && b:current_syntax == "javascript"
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if main_syntax == "javascript"
    syn sync minlines=500
endif

syn match js_comment "\/\/.*"
syn region js_comment start="/\*" end="\*/"
syn region js_string start=+"+ skip=+\\"+ end=+"+
syn region js_string start="'" skip="\\'" end="'"
syn region js_string start="`" skip="\\`" end="`"

hi def link js_comment Comment
hi def link js_string String

let b:current_syntax = "javascript"
if main_syntax == "javascript"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

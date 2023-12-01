if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn sync minlines=500

syn match c_comment "\/\/.*"
syn region c_comment start="/\*" end="\*/"
syn region c_string start=+"+ skip=+\\"+ end=+"+
syn region c_string start="'" skip="\\'" end="'"
syn match c_string display contained "<[^>]*>"
syn match c_include display "^\s*\zs\%(%:\|#\)\s*include\>\s*<" contains=c_string

hi def link c_comment Comment
hi def link c_string String

let b:current_syntax = "c"
let &cpo = s:cpo_save
unlet s:cpo_save

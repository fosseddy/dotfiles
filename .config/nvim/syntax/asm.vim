if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn sync minlines=500

syn match asm_comment "#.*"
syn region asm_comment start="/\*" end="\*/"
syn region asm_string start=+"+ skip=+\\"+ end=+"+
syn match asm_string "'\\\=."

hi def link asm_comment Comment
hi def link asm_string String

let b:current_syntax = "asm"
let &cpo = s:cpo_save
unlet s:cpo_save

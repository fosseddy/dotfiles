if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match
syn sync minlines=500

syn region cCommentL start="//" end="$" contains=@Spell
syn region cComment  start="/\*" end="\*/" contains=@Spell

syn region cString    start=+\%(L\|U\|u8\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell extend
syn region cCharacter start=+L\='+ skip=+\\\\\|\\'+ end=+'+

hi def link cCommentL  Comment
hi def link cComment   Comment
hi def link cString    String
hi def link cCharacter String

let b:current_syntax = "c"

let &cpo = s:cpo_save
unlet s:cpo_save

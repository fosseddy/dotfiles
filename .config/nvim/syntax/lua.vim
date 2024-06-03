if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn sync fromstart

syn match lua_comment "--.*"
syn region lua_comment start="--\[\[" end="\]\]"
syn region lua_string start=+\z(['"]\)+ skip="\\\z1" end="\z1"
syn region lua_bracket_string start="\[\[" end="\]\]" contains=lua_bracket_string

hi def link lua_comment Comment
hi def link lua_string String
hi def link lua_bracket_string String

let b:current_syntax = "lua"
let &cpo = s:cpo_save
unlet s:cpo_save

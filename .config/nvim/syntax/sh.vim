if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn sync fromstart

syn match sh_argnum "$#"
syn match sh_comment "#.*"
syn region sh_string start=+\z(['"]\)+ skip="\\\z1" end="\z1"
syn region sh_string start="\(<<\)\@<=\(\"\=\)\z(\I\i*\)\2$" end="^\s*\z1\>"
syn region sh_string start="\(<<\)\@<='\z(\I\i*\)'$" end="^\s*\z1\>"
syn region sh_string start=+\(<<\)\@<="\z(\I\i*\)"$+ end="^\s*\z1\>"

hi def link sh_comment Comment
hi def link sh_string String

let b:current_syntax = "sh"
let &cpo = s:cpo_save
unlet s:cpo_save

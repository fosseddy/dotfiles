if exists("b:current_syntax")
    finish
endif

let s:keepcpo = &cpo
set cpo&vim

syn sync fromstart

runtime! syntax/html.vim
unlet b:current_syntax

syn region php_region start="<?\(php\|=\)" end="?>" contains=php_comment,php_string keepend
syn match php_comment "\/\/.*" contained
syn match php_comment "#.*" contained
syn region php_comment start="/\*" end="\*/" contained
syn region php_string start=+\z(['"`]\)+ skip="\\\z1" end="\z1" contained
syn region php_string start="\(<<<\)\@<=\(\"\=\)\z(\I\i*\)\2$" end="^\s*\z1\>" contained
syn region php_string start="\(<<<\)\@<='\z(\I\i*\)'$" end="^\s*\z1\>" contained

hi def link php_comment Comment
hi def link php_string String

let b:current_syntax = "php"
let &cpo = s:keepcpo
unlet s:keepcpo

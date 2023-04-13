if exists("b:current_syntax")
    finish
endif

if !exists("main_syntax")
    let main_syntax = "php"
endif

runtime! syntax/html.vim
unlet b:current_syntax

let s:cpo_save = &cpo
set cpo&vim

syn case match
if main_syntax == "php"
    syn sync minlines=500
endif

let b:current_syntax = "php"

if main_syntax == "php"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

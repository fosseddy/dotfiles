if exists("b:current_syntax")
    finish
endif

if !exists("main_syntax")
    let main_syntax = "html"
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

if main_syntax == "html"
    syn sync fromstart
endif

syn include @syntax_css syntax/css.vim
unlet b:current_syntax
syn include @syntax_js syntax/javascript.vim
unlet b:current_syntax

syn region html_tag start="<[^/]" end=">" contains=html_string
syn region html_string start=+\z(['"]\)+ skip="\\\z1" end="\z1" contained
syn region html_comment start="<!--" end="--\s*>"
syn region html_comment start="<!DOCTYPE" end=">" keepend
syn region html_tag_css start="<style\>\_[^>]*>" end="</style>" contains=@syntax_css keepend
syn region html_tag_script start="<script\>\_[^>]*>" end="</script\_[^>]*>" contains=@syntax_js keepend

hi def link html_comment Comment
hi def link html_string String

let b:current_syntax = "html"
if main_syntax == "html"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

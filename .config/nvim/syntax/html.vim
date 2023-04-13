if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = "html"
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

if main_syntax == "html"
    syn sync minlines=500
endif

syn region  htmlTag		   start=+<[^/]+   end=+>+ fold contains=htmlString

syn region  htmlString	 contained start=+"+ end=+"+
syn region  htmlString	 contained start=+'+ end=+'+

syn include @htmlCss syntax/css.vim
unlet b:current_syntax
syn region cssTag start=+<style\>\_[^>]*>+ keepend end=+</style>+ contains=@htmlCss

syn include @htmlJavaScript syntax/javascript.vim
unlet b:current_syntax
syn region  scriptTag start=+<script\>\_[^>]*>+ keepend end=+</script\_[^>]*>+ contains=@htmlJavaScript

syn region htmlComment	start=+<!--+	end=+--\s*>+	contains=@Spell
syn region htmlComment	start=+<!DOCTYPE+	end=+>+ keepend

hi def link htmlComment		   Comment
hi def link htmlString		   String

let b:current_syntax = "html"

if main_syntax == "html"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

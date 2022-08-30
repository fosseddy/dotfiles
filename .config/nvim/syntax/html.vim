if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = "html"
endif


syn region htmlTag start=+<+ end=+>+ contains=htmlComment,htmlTagName,htmlString

syn region htmlComment start="<!--" end="-->" contained
syn region htmlComment start="<!DOCTYPE" end=">" keepend contained

syn match htmlTagName /<\s*[-a-zA-Z0-9]\+/hs=s+1 contained
syn match htmlTagName /<\/\s*[-a-zA-Z0-9]\+/hs=s+2 contained

syn region htmlString start=+"+ skip=+\\"+ end=+"+ contained
syn region htmlString start=+'+ skip=+\\'+ end=+'+ contained

syn match htmlSpecial "&#\=[0-9A-Za-z]\{1,8};"

syn include @htmlJavascript syntax/javascript.vim
unlet b:current_syntax
syn region javascriptScript start=+<script\_[^>]*>+ end=+</script\_[^>]*>+ keepend contains=@htmlJavascript,htmlTag

syn include @htmlCss syntax/css.vim
unlet b:current_syntax
syn region cssStyle start=+<style\_[^>]*>+ end=+</style\_[^>]*>+ keepend contains=@htmlCss,htmlTag

hi def link htmlTagName Statement
hi def link htmlString  String
hi def link htmlSpecial String
hi def link htmlComment Comment

let b:current_syntax = "html"
if main_syntax == "html"
  syn sync minlines=200
  unlet main_syntax
endif


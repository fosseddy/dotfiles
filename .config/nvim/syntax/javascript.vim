if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = "javascript"
endif

syn keyword javascriptKeyword await break case catch class const continue debugger default delete do else enum export
syn keyword javascriptKeyword extends finally for function if implements import in instanceof interface let new package
syn keyword javascriptKeyword private protected public return static super switch this throw try typeof var void while
syn keyword javascriptKeyword with yield async

syn region javascriptComment start="/\*" end="\*/"
syn region javascriptComment start="//" skip="\\$" end="$" keepend

syn region javascriptString start=+'+ skip=+\\'+ end=+'+
syn region javascriptString start=+"+ skip=+\\"+ end=+"+
syn region javascriptString start=+`+ skip=+\\`+ end=+`+ contains=javascriptTemplateValue
syn region javascriptTemplateValue start=+${+ end=+}+ contained

syn match javascriptSpecial "\\[0-7]\{3}" display contained containedin=javascriptString
syn match javascriptSpecial +\\[abfnrtv\\'"]+ display contained containedin=javascriptString
syn match javascriptSpecial "\\x\x\{2}" display contained containedin=javascriptString
syn match javascriptSpecial "\\u\x\{4}" display contained containedin=javascriptString
syn match javascriptSpecial "\\U\x\{8}" display contained containedin=javascriptString

syn region javascriptRegexp start=+[,(=+]\s*/[^/*]+ms=e-1,me=e-1 skip=+\\\\\|\\/+ end=+/[gimuys]\{0,2\}\s*$+
                          \ end=+/[gimuys]\{0,2\}\s*[+;.,)\]}]+me=e-1 end=+/[gimuys]\{0,2\}\s\+\/+me=e-1 oneline

hi def link javascriptKeyword Statement
hi def link javascriptComment Comment
hi def link javascriptString  String
hi def link javascriptRegexp  String
hi def link javascriptSpecial Special

let b:current_syntax = "javascript"
if main_syntax == "javascript"
  syn sync minlines=200
  unlet main_syntax
endif

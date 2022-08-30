if exists("b:current_syntax")
  finish
endif

syn keyword goKeyword break default func interface select case defer go map struct chan else goto package switch const
                    \ fallthrough if range type continue for import return var

syn region goComment start="/\*" end="\*/"
syn region goComment start="//" skip="\\$" end="$" keepend

syn region goString start=+'+ skip=+\\'+ end=+'+
syn region goString start=+"+ skip=+\\"+ end=+"+
syn region goString start=+`+ end=+`+

syn match goSpecial "\\[0-7]\{3}" display contained containedin=goString
syn match goSpecial +\\[abfnrtv\\'"]+ display contained containedin=goString
syn match goSpecial "\\x\x\{2}" display contained containedin=goString
syn match goSpecial "\\u\x\{4}" display contained containedin=goString
syn match goSpecial "\\U\x\{8}" display contained containedin=goString

hi def link goKeyword Statement
hi def link goTodo    Todo
hi def link goComment Comment
hi def link goString  String
hi def link goSpecial Special

syn sync minlines=200
let b:current_syntax = "go"

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = "typescript"
endif

syn keyword typescriptKeyword break as case implements catch interface constructor class let declare const package get
syn keyword typescriptKeyword continue private module debugger protected require default public delete static set do
syn keyword typescriptKeyword yield else enum type export from extends of finally for function if import in instanceof
syn keyword typescriptKeyword new return super switch this throw try typeof var while with async await namespace

syn region typescriptComment start="/\*" end="\*/"
syn region typescriptComment start="//" skip="\\$" end="$" keepend

syn region typescriptString start=+'+ skip=+\\'+ end=+'+
syn region typescriptString start=+"+ skip=+\\"+ end=+"+
syn region typescriptString start=+`+ skip=+\\`+ end=+`+ contains=typescriptInterpolation

syn region typescriptInterpolation start=+${+ end=+}+ contained contains=typescriptInterpolationValue
syn match typescriptInterpolationValue /${\_.\{-}}/hs=s+2,ms=s+2,he=e-1,me=e-1 contained contains=typescriptString,typescriptComment

" @TODO(art): Special chars
" @TODO(art): Regexp
" @TODO(art): React support?

hi def link typescriptKeyword Statement
hi def link typescriptComment Comment
hi def link typescriptString String
hi def link typescriptInterpolation Statement

let b:current_syntax = "typescript"
if main_syntax == "typescript"
  syn sync minlines=200
  unlet main_syntax
endif

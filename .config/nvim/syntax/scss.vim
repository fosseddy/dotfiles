if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn region scssComment start="//" skip="\\$" end="$" keepend containedin=cssBlock

syn match scssVarDecl /.*\$.*:.*/ contains=cssString containedin=cssBlock

syn region scssInterpolation start=+#{+ skip=+\\}+ end=+}+ containedin=cssBlock,cssString

hi def link scssComment Comment
hi def link scssInterpolation Special

let b:current_syntax = "scss"

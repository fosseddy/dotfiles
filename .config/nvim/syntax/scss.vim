if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore
syn iskeyword @,48-57,_,192-255,-,$

syn region scssComment start="//" skip="\\$" end="$" keepend

syn match scssAtRule /@\(use\|forward\|import\|mixin\|include\|function\|return\|extend\|at-root\|error\)/
syn match scssAtRule /@\(warn\|debug\|if\|else\|each\|for\|while\|content\)/

syn region scssInterpolation start=/#{/ skip=/\\}/ end=/}/ contains=scssInterpolationValue containedin=cssString,cssUrl
syn match scssInterpolationValue /#{\_.\{-}}/hs=s+2,ms=s+2,he=e-1,me=e-1 contained contains=cssString

hi def link scssComment Comment
hi def link scssAtRule  Statement
hi def link scssInterpolation String

let b:current_syntax = "scss"

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "typescript"

syn keyword typescriptKeyword var let const function async await

hi def link typescriptKeyword Statement

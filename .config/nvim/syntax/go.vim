if exists("b:current_syntax")
    finish
endif

let s:keepcpo = &cpo
set cpo&vim

syn case match
syn sync minlines=500

syn region      goComment           start="//" end="$" contains=@Spell
syn region      goComment           start="/\*" end="\*/" contains=@Spell

syn region      goString            start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region      goRawString         start=+`+ end=+`+
syn match       goImportString      /^\%(\s\+\|import \)\(\h\w* \)\?\zs"[^"]\+"$/ contained

syn region      goCharacter         start=+'+ skip=+\\\\\|\\'+ end=+'+

hi def link     goComment           Comment
hi def link     goImportString      String
hi def link     goString            String
hi def link     goRawString         String
hi def link     goCharacter         String

let b:current_syntax = "go"

let &cpo = s:keepcpo
unlet s:keepcpo

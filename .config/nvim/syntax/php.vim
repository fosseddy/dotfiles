if exists("b:current_syntax")
    finish
endif

if !exists("main_syntax")
    let main_syntax = "php"
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match
if main_syntax == "php"
    syn sync minlines=500
endif

runtime syntax/html.vim
unlet b:current_syntax

syn region phpStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+ contained contains=phpInterpSimple,phpInterpComplex extend keepend
syn region phpStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'+ contained keepend extend
syn region phpStringBacktick start=+`+ skip=+\\\\\|\\"+ end=+`+ contained extend keepend
syn region phpHereDoc start="\(<<<\)\@<=\(\"\=\)\z(\I\i*\)\2$" end="^\s*\z1\>" contained contains=phpInterpSimple,phpInterpComplex,@Spell keepend extend
syn region phpNowDoc start="\(<<<\)\@<='\z(\I\i*\)'$" end="^\s*\z1\>" contained contains=@Spell keepend extend
syn cluster phpString contains=phpStringDouble,phpStringSingle,phpStringBacktick,phpHereDoc,phpNowDoc

syn match phpInterpSimple "\$\h\w*\(\[[^]]*\]\|?\?->\h\w*\)\?" contained display
syn region phpInterpComplex start="{\$" end="}" contains=@phpString contained extend

syn region phpComment start="/\*" end="\*/" contained contains=@Spell
syn match phpComment "#.\{-}\(?>\|$\)\@=" contained contains=@Spell
syn match phpComment "//.\{-}\(?>\|$\)\@=" contained contains=@Spell

syn region phpRegion start="<?\(php\)\=" end="?>" contains=@phpString,phpComment

hi def link phpStringSingle String
hi def link phpStringDouble String
hi def link phpStringBacktick String
hi def link phpHereDoc String
hi def link phpNowDoc String
hi def link phpComment Comment

let b:current_syntax = "php"

if main_syntax == "php"
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

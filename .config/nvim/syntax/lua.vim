if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if !exists("lua_version")
    let lua_version = 5
    let lua_subversion = 3
elseif !exists("lua_subversion")
    let lua_subversion = 0
endif

syn case match
syn sync minlines=500

syn match   luaComment         "--.*$" contains=@Spell
if lua_version == 5 && lua_subversion == 0
    syn region luaComment        matchgroup=luaCommentDelimiter start="--\[\[" end="\]\]" contains=luaInnerComment,@Spell
    syn region luaInnerComment   contained transparent start="\[\[" end="\]\]"
elseif lua_version > 5 || (lua_version == 5 && lua_subversion >= 1)
    syn region luaComment        matchgroup=luaCommentDelimiter start="--\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
endif

if lua_version == 5
    if lua_subversion == 0
        syn region luaString2 matchgroup=luaStringDelimiter start=+\[\[+ end=+\]\]+ contains=luaString2,@Spell
    else
        syn region luaString2 matchgroup=luaStringDelimiter start="\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
    endif
endif
syn region luaString matchgroup=luaStringDelimiter start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=@Spell
syn region luaString matchgroup=luaStringDelimiter start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=@Spell

hi def link luaComment          Comment
hi def link luaCommentDelimiter luaComment
hi def link luaString           String
hi def link luaString2          String
hi def link luaStringDelimiter  luaString

let b:current_syntax = "lua"

let &cpo = s:cpo_save
unlet s:cpo_save

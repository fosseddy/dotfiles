if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = "typescript"
elseif exists("b:current_syntax") && b:current_syntax == "typescript"
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if main_syntax == "typescript"
    syn sync fromstart
    syn sync maxlines=500

    syn sync ccomment typescriptComment
endif

syn match   typescriptLineComment      "\/\/.*" contains=@Spell
syn region  typescriptComment	       start="/\*"  end="\*/" contains=@Spell

syn region  typescriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+
syn region  typescriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+
syn region  typescriptStringT	       start=+`+  skip=+\\\\\|\\`+  end=+`+	contains=typescriptEmbed
syn region  typescriptEmbed	           start=+${+  end=+}+	contains=@typescriptEmbededExpr

syn cluster typescriptEmbededExpr	contains=typescriptStringD,typescriptStringS,typescriptStringT

hi def link typescriptComment		Comment
hi def link typescriptLineComment	Comment
hi def link typescriptStringD		String
hi def link typescriptStringS		String
hi def link typescriptStringT		String

let b:current_syntax = "typescript"
if main_syntax == "typescript"
    unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = "javascript"
elseif exists("b:current_syntax") && b:current_syntax == "javascript"
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if main_syntax == "javascript"
    syn sync fromstart
    syn sync maxlines=500

    syn sync ccomment javaScriptComment
endif

syn match   javaScriptLineComment      "\/\/.*" contains=@Spell
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell

syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+
syn region  javaScriptStringT	       start=+`+  skip=+\\\\\|\\`+  end=+`+	contains=javaScriptEmbed
syn region  javaScriptEmbed	           start=+${+  end=+}+	contains=@javaScriptEmbededExpr

syn cluster javaScriptEmbededExpr	contains=javaScriptStringD,javaScriptStringS,javaScriptStringT

hi def link javaScriptComment		Comment
hi def link javaScriptLineComment	Comment
hi def link javaScriptStringD		String
hi def link javaScriptStringS		String
hi def link javaScriptStringT		String

let b:current_syntax = "javascript"
if main_syntax == "javascript"
    unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = "css"
endif

syn region cssComment start="/\*" end="\*/"

syn region cssString start=+"+ skip=+\\"+ end=+"+
syn region cssString start=+'+ skip=+\\'+ end=+'+

syn match cssAtRule /@\(charset\|color-profile\|counter-style\|font-face\|
                       \font-feature-values\|import\|keyframes\|layer\|media\|
                       \namespace\|page\|property\|scroll-timeline\|supports\)/

syn match cssProp /[a-zA-Z-_]\+:/he=e-1 display contained
syn region cssBlock start="{" end="}" transparent contains=cssBlock,cssProp,cssString
syn match cssPseudo /:\{1,2}[a-zA-Z0-9-_]\+/

syn region cssSelectorAttr start=/\[/ end=/\]/
syn match cssSelector /#[a-zA-Z0-9-_]\+/
syn match cssSelector /\.[a-zA-Z0-9-_]\+/hs=s+1

syn keyword cssSelectorType abbr address area a b base bdo blockquote body br
                          \ button caption cite code col colgroup dd del dfn
                          \ div dl dt em fieldset form h1 h2 h3 h4 h5 h6 head
                          \ hr html img i iframe input ins isindex kbd label
                          \ legend li link map menu meta noscript ol optgroup
                          \ option p param picture pre q s samp script small
                          \ span strong sub sup tbody td textarea tfoot th
                          \ thead title tr ul u var object svg select style
                          \ table article aside audio bdi canvas command data
                          \ datalist details dialog embed figcaption figure
                          \ footer header hgroup keygen main mark menuitem
                          \ meter nav output progress rt rp ruby section source
                          \ summary time track video wbr

hi def link cssComment      Comment
hi def link cssString       String
hi def link cssAtRule       Statement
hi def link cssSelector     String
hi def link cssSelectorType Statement

let b:current_syntax = "css"
if main_syntax == "css"
  syn sync minlines=200
  unlet main_syntax
endif

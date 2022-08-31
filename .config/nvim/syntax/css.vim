if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = "css"
endif

syn region cssComment start="/\*" end="\*/"

syn region cssString start=+"+ skip=+\\"+ end=+"+
syn region cssString start=+'+ skip=+\\'+ end=+'+

syn region cssUrlRegion start=/\<\(uri\|url\|local\|format\)\s*(/ skip=/\\)/ end=/)/ contains=cssUrl
syn match cssUrl /(\_.\{-})/hs=s+1,ms=s+1,he=e-1,me=e-1 contained contains=cssString

syn match cssAtRule /@\(charset\|color-profile\|counter-style\|font-face\|font-feature-values\|import\|keyframes\)/
syn match cssAtRule /@\(layer\|media\|namespace\|page\|property\|scroll-timeline\|supports\)/

syn match cssProp /\<\(-webkit-line-clamp\|-webkit-text-fill-color\|-webkit-text-stroke\|-webkit-text-stroke-color\)\>/
syn match cssProp /\<\(-webkit-text-stroke-width\|accent-color\|align-content\|align-items\|align-self\|align-tracks\)\>/
syn match cssProp /\<\(all\|animation\|animation-delay\|animation-direction\|animation-duration\|animation-fill-mode\)\>/
syn match cssProp /\<\(animation-iteration-count\|animation-name\|animation-play-state\|animation-timeline\)\>/
syn match cssProp /\<\(animation-timing-function\|appearance\|aspect-ratio\|backdrop-filter\|backface-visibility\)\>/
syn match cssProp /\<\(background\|background-attachment\|background-blend-mode\|background-clip\|background-color\)\>/
syn match cssProp /\<\(background-image\|background-origin\|background-position\|background-position-x\)\>/
syn match cssProp /\<\(background-position-y\|background-repeat\|background-size\|block-size\|border\|border-block\)\>/
syn match cssProp /\<\(border-block-color\|border-block-end\|border-block-end-color\|border-block-end-style\)\>/
syn match cssProp /\<\(border-block-end-width\|border-block-start\|border-block-start-color\|border-block-start-style\)\>/
syn match cssProp /\<\(border-block-start-width\|border-block-style\|border-block-width\|border-bottom\)\>/
syn match cssProp /\<\(border-bottom-color\|border-bottom-left-radius\|border-bottom-right-radius\|border-bottom-style\)\>/
syn match cssProp /\<\(border-bottom-width\|border-collapse\|border-color\|border-end-end-radius\)\>/
syn match cssProp /\<\(border-end-start-radius\|border-image\|border-image-outset\|border-image-repeat\)\>/
syn match cssProp /\<\(border-image-slice\|border-image-source\|border-image-width\|border-inline\|border-inline-color\)\>/
syn match cssProp /\<\(border-inline-end\|border-inline-end-color\|border-inline-end-style\|border-inline-end-width\)\>/
syn match cssProp /\<\(border-inline-start\|border-inline-start-color\|border-inline-start-style\)\>/
syn match cssProp /\<\(border-inline-start-width\|border-inline-style\|border-inline-width\|border-left\)\>/
syn match cssProp /\<\(border-left-color\|border-left-style\|border-left-width\|border-radius\|border-right\)\>/
syn match cssProp /\<\(border-right-color\|border-right-style\|border-right-width\|border-spacing\)\>/
syn match cssProp /\<\(border-start-end-radius\|border-start-start-radius\|border-style\|border-top\|border-top-color\)\>/
syn match cssProp /\<\(border-top-left-radius\|border-top-right-radius\|border-top-style\|border-top-width\)\>/
syn match cssProp /\<\(border-width\|bottom\|box-decoration-break\|box-shadow\|box-sizing\|break-after\|break-before\)\>/
syn match cssProp /\<\(break-inside\|caption-side\|caret-color\|clear\|clip-path\|color\|color-scheme\|column-count\)\>/
syn match cssProp /\<\(column-fill\|column-gap\|column-rule\|column-rule-color\|column-rule-style\|column-rule-width\)\>/
syn match cssProp /\<\(column-span\|column-width\|columns\|contain\|content\|content-visibility\|counter-increment\)\>/
syn match cssProp /\<\(counter-reset\|counter-set\|cursor\|direction\|display\|empty-cells\|filter\|flex-basis\)\>/
syn match cssProp /\<\(flex-direction\|flex-flow\|flex-grow\|flex-shrink\|flex-wrap\|float\|font\|font-family\)\>/
syn match cssProp /\<\(font-feature-settings\|font-kerning\|font-language-override\|font-optical-sizing\|font-size\)\>/
syn match cssProp /\<\(font-size-adjust\|font-stretch\|font-style\|font-synthesis\|font-variant\)\>/
syn match cssProp /\<\(font-variant-alternates\|font-variant-caps\|font-variant-east-asian\|font-variant-ligatures\)\>/
syn match cssProp /\<\(font-variant-numeric\|font-variant-position\|font-variation-settings\|font-weight\)\>/
syn match cssProp /\<\(forced-color-adjust\|gap\|grid-area\|grid-auto-columns\|grid-auto-flow\)\>/
syn match cssProp /\<\(grid-auto-rows\|grid-column\|grid-column-end\|grid-column-start\|grid-row\|grid-row-end\)\>/
syn match cssProp /\<\(grid-row-start\|grid-template\|grid-template-areas\|grid-template-columns\|grid-template-rows\)\>/
syn match cssProp /\<\(hanging-punctuation\|height\|hyphenate-character\|hyphens\|image-orientation\|image-rendering\)\>/
syn match cssProp /\<\(image-resolution\|initial-letter\|initial-letter-align\|inline-size\|inset\|inset-block\)\>/
syn match cssProp /\<\(inset-block-end\|inset-block-start\|inset-inline\|inset-inline-end\|inset-inline-start\)\>/
syn match cssProp /\<\(isolation\|justify-content\|justify-items\|justify-self\|justify-tracks\|left\|letter-spacing\)\>/
syn match cssProp /\<\(line-break\|line-height\|line-height-step\|list-style\|list-style-image\|list-style-position\)\>/
syn match cssProp /\<\(list-style-type\|margin\|margin-block\|margin-block-end\|margin-block-start\|margin-bottom\)\>/
syn match cssProp /\<\(margin-inline\|margin-inline-end\|margin-inline-start\|margin-left\|margin-right\|margin-top\)\>/
syn match cssProp /\<\(margin-trim\|mask\|mask-border\|mask-border-mode\|mask-border-outset\|mask-border-repeat\)\>/
syn match cssProp /\<\(mask-border-slice\|mask-border-source\|mask-border-width\|mask-clip\|mask-composite\|mask-image\)\>/
syn match cssProp /\<\(mask-mode\|mask-origin\|mask-position\|mask-repeat\|mask-size\|mask-type\|masonry-auto-flow\)\>/
syn match cssProp /\<\(max-block-size\|max-height\|max-inline-size\|max-width\|min-block-size\|min-height\)\>/
syn match cssProp /\<\(min-inline-size\|min-width\|mix-blend-mode\|object-fit\|object-position\|offset\|offset-anchor\)\>/
syn match cssProp /\<\(offset-distance\|offset-path\|offset-position\|offset-rotate\|opacity\|order\|orphans\|outline\)\>/
syn match cssProp /\<\(outline-color\|outline-offset\|outline-style\|outline-width\|overflow\|overflow-anchor\)\>/
syn match cssProp /\<\(overflow-block\|overflow-clip-margin\|overflow-inline\|overflow-wrap\|overflow-x\|overflow-y\)\>/
syn match cssProp /\<\(overscroll-behavior\|overscroll-behavior-block\|overscroll-behavior-inline\)\>/
syn match cssProp /\<\(overscroll-behavior-x\|overscroll-behavior-y\|padding\|padding-block\|padding-block-end\)\>/
syn match cssProp /\<\(padding-block-start\|padding-bottom\|padding-inline\|padding-inline-end\|padding-inline-start\)\>/
syn match cssProp /\<\(padding-left\|padding-right\|padding-top\|page-break-after\|page-break-before\)\>/
syn match cssProp /\<\(page-break-inside\|paint-order\|perspective\|perspective-origin\|place-content\|place-items\)\>/
syn match cssProp /\<\(place-self\|pointer-events\|position\|print-color-adjust\|quotes\|resize\|right\|rotate\)\>/
syn match cssProp /\<\(row-gap\|ruby-align\|ruby-position\|scale\|scroll-behavior\|scroll-margin\|scroll-margin-block\)\>/
syn match cssProp /\<\(scroll-margin-block-end\|scroll-margin-block-start\|scroll-margin-bottom\|scroll-margin-inline\)\>/
syn match cssProp /\<\(scroll-margin-inline-end\|scroll-margin-inline-start\|scroll-margin-left\|scroll-margin-right\)\>/
syn match cssProp /\<\(scroll-margin-top\|scroll-padding\|scroll-padding-block\|scroll-padding-block-end\)\>/
syn match cssProp /\<\(scroll-padding-block-start\|scroll-padding-bottom\|scroll-padding-inline\)\>/
syn match cssProp /\<\(scroll-padding-inline-end\|scroll-padding-inline-start\|scroll-padding-left\)\>/
syn match cssProp /\<\(scroll-padding-right\|scroll-padding-top\|scroll-snap-align\|scroll-snap-stop\|scroll-snap-type\)\>/
syn match cssProp /\<\(scrollbar-color\|scrollbar-gutter\|scrollbar-width\|shape-image-threshold\|shape-margin\)\>/
syn match cssProp /\<\(shape-outside\|tab-size\|table-layout\|text-align\|text-align-last\|text-combine-upright\)\>/
syn match cssProp /\<\(text-decoration\|text-decoration-color\|text-decoration-line\|text-decoration-skip\)\>/
syn match cssProp /\<\(text-decoration-skip-ink\|text-decoration-style\|text-decoration-thickness\|text-emphasis\)\>/
syn match cssProp /\<\(text-emphasis-color\|text-emphasis-position\|text-emphasis-style\|text-indent\|text-justify\)\>/
syn match cssProp /\<\(text-orientation\|text-overflow\|text-rendering\|text-shadow\|text-size-adjust\|text-transform\)\>/
syn match cssProp /\<\(text-underline-offset\|text-underline-position\|top\|touch-action\|transform\|transform-box\)\>/
syn match cssProp /\<\(transform-origin\|transform-style\|transition\|transition-delay\|transition-duration\)\>/
syn match cssProp /\<\(transition-property\|transition-timing-function\|translate\|unicode-bidi\|user-select\)\>/
syn match cssProp /\<\(vertical-align\|visibility\|white-space\|widows\|width\|will-change\|word-break\|word-spacing\)\>/
syn match cssProp /\<\(writing-mode\|z-index\|grid-gap\)\>/

hi def link cssComment Comment
hi def link cssString  String
hi def link cssUrl     String
hi def link cssAtRule  Statement
hi def link cssProp    Statement

let b:current_syntax = "css"
if main_syntax == "css"
  syn sync minlines=200
  unlet main_syntax
endif

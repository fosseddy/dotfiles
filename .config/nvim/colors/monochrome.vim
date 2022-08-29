hi clear
if exists("syntax_on")
   syntax reset
endif

set background=dark

let g:colors_name = "monochrome"

" Colors
let s:red = '#e27878'
let s:cyan = '#89b8c2'
let s:blue = '#84a0c6'
let s:green = '#b4be82'
let s:white = '#c6c8d1'
let s:black = '#161821'
let s:yellow = '#e2a478'
let s:magenta = '#a093c7'

" Themes
let s:themes = {
\  "yellow_red": {
\    "fg": "#d6cbc5",
\    "bg": "#161821",
\    "lbg": "#454b68",
\    "dbg": "#0e0f15",
\    "str": "#d2a494",
\    "kwd": "#f7d492"
\  }
\ }

" Theme
let s:theme = s:themes.yellow_red

" --- UI ----------------------------------------------------------------------
exec 'hi Cursor      gui=none                      guibg='.s:white
exec 'hi CursorI     gui=none                      guibg='.s:cyan
exec 'hi CursorR     gui=none                      guibg='.s:yellow
exec 'hi CursorLine  gui=none guifg='.s:theme.kwd 'guibg='.s:theme.lbg

exec 'hi Title       gui=none guifg='.s:theme.str 'guibg='.s:theme.bg
exec 'hi Normal      gui=none guifg='.s:theme.fg
exec 'hi Search      gui=none                      guibg='.s:theme.kwd
exec 'hi Visual      gui=none guifg='.s:theme.fg  'guibg='.s:theme.lbg
exec 'hi LineNr      gui=none guifg='.s:theme.lbg
exec 'hi NonText     gui=none guifg='.s:theme.lbg
exec 'hi ErrorMsg    gui=none guifg='.s:red       'guibg='.s:theme.bg

exec 'hi Pmenu       gui=none guifg='.s:theme.fg  'guibg='.s:theme.dbg
exec 'hi PmenuSel    gui=none guifg='.s:theme.str 'guibg='.s:theme.lbg
exec 'hi PmenuSbar   gui=none guifg='.s:theme.fg  'guibg='.s:theme.lbg
exec 'hi PmenuThumb  gui=none guifg='.s:theme.fg  'guibg='.s:theme.str

exec 'hi Directory   gui=none guifg='.s:theme.fg
exec 'hi VertSplit   gui=none guifg='.s:theme.bg  'guibg='.s:theme.lbg
exec 'hi MatchParen  gui=none guifg='.s:theme.kwd 'guibg='.s:theme.lbg
exec 'hi SignColumn  gui=none                      guibg='.s:theme.bg
exec 'hi ColorColumn gui=none                      guibg='.s:theme.dbg

" --- Languages ---------------------------------------------------------------
exec 'hi Constant  gui=none guifg='.s:theme.fg
exec 'hi String    gui=none guifg='.s:theme.str
"exec 'hi Character gui=none guifg='
"exec 'hi Number    gui=none guifg='
"exec 'hi Boolean   gui=none guifg='
"exec 'hi Float     gui=none guifg='

exec 'hi Identifier gui=none guifg='.s:theme.fg
"exec 'hi Function   gui=none guifg='

exec 'hi Statement   gui=none guifg='.s:theme.kwd
"exec 'hi Conditional gui=none guifg='
"exec 'hi Repeat      gui=none guifg='
"exec 'hi Label       gui=none guifg='
"exec 'hi Operator    gui=none guifg='
"exec 'hi Keyword     gui=none guifg='
"exec 'hi Exception   gui=none guifg='

exec 'hi PreProc   gui=none guifg='.s:theme.fg
"exec 'hi Include   gui=none guifg='
"exec 'hi Define    gui=none guifg='
"exec 'hi Macro     gui=none guifg='
"exec 'hi PreCondit gui=none guifg='

exec 'hi Type         gui=none guifg='.s:theme.kwd
"exec 'hi StorageClass gui=none guifg='
"exec 'hi Structure    gui=none guifg='
"exec 'hi Typedef      gui=none guifg='

exec 'hi Special        gui=none guifg='.s:theme.fg
"exec 'hi SpecialChar    gui=none guifg='
"exec 'hi Tag            gui=none guifg='
"exec 'hi Delimiter      gui=none guifg='
"exec 'hi SpecialComment gui=none guifg='
"exec 'hi Debug          gui=none guifg='

exec 'hi Comment    gui=none guifg='.s:theme.lbg
exec 'hi Todo       gui=none guifg='.s:theme.lbg 'guibg='.s:theme.bg
exec 'hi Underlined gui=none guifg='.s:theme.fg
exec 'hi Ignore     gui=none guifg='.s:theme.bg
exec 'hi Error      gui=none guifg='.s:theme.bg  'guibg='.s:red

" --- Lightline ---------------------------------------------------------------
let s:p = {'normal': {}, 'insert': {}, 'command': {}, 'visual': {}, 'replace': {}, 'inactive': {}, 'tabline': {}}
let s:p.normal.left = [[s:theme.bg, s:theme.fg], [s:theme.fg, s:theme.lbg]]
let s:p.normal.right = [[s:theme.fg, s:theme.lbg], [s:theme.fg, s:theme.lbg]]
let s:p.normal.middle = [[s:theme.fg, s:theme.dbg]]
let s:p.insert.left = [[s:theme.bg, s:theme.kwd], [s:theme.fg, s:theme.lbg]]
let s:p.command.left = [[s:theme.bg, s:theme.kwd], [s:theme.fg, s:theme.lbg]]
let s:p.visual.left = [[s:theme.bg, s:theme.str], [s:theme.fg, s:theme.lbg]]
let s:p.replace.left = [[s:theme.bg, s:theme.fg], [s:theme.fg, s:theme.lbg]]
let s:p.inactive.left = [[s:theme.fg, s:theme.lbg]]
let s:p.tabline.left = [[s:theme.fg, s:theme.dbg]]
let s:p.tabline.tabsel = [[s:theme.fg, s:theme.lbg]]
let s:p.tabline.middle = [[s:theme.fg, s:theme.dbg]]
let g:lightline#colorscheme#monochrome#palette = lightline#colorscheme#fill(s:p)

"" --- TypeScript --------------------------------------------------------------
"exec 'hi typescriptRef                gui=none guifg='.s:theme.lbg
"exec 'hi typescriptTry                gui=none guifg='.s:theme.kwd
"exec 'hi typescriptUnion              gui=none guifg='.s:theme.fg
"exec 'hi typescriptImport             gui=none guifg='.s:theme.kwd
"exec 'hi typescriptExport             gui=none guifg='.s:theme.kwd
"exec 'hi typescriptModule             gui=none guifg='.s:theme.kwd
"exec 'hi typescriptAbstract           gui=none guifg='.s:theme.kwd
"exec 'hi typescriptOperator           gui=none guifg='.s:theme.kwd
"exec 'hi typescriptVariable           gui=none guifg='.s:theme.kwd
"exec 'hi typescriptArrowFunc          gui=none guifg='.s:theme.fg
"exec 'hi typescriptFuncComma          gui=none guifg='.s:theme.fg
"exec 'hi typescriptPrototype          gui=none guifg='.s:theme.fg
"exec 'hi typescriptExceptions         gui=none guifg='.s:theme.kwd
"exec 'hi typescriptImportType         gui=none guifg='.s:theme.kwd
"exec 'hi typescriptExportType         gui=none guifg='.s:theme.kwd
"exec 'hi typescriptObjectLabel        gui=none guifg='.s:theme.fg
"exec 'hi typescriptEnumKeyword        gui=none guifg='.s:theme.kwd
"exec 'hi typescriptCastKeyword        gui=none guifg='.s:theme.kwd
"exec 'hi typescriptPredefinedType     gui=none guifg='.s:theme.fg
"exec 'hi typescriptAmbientDeclaration gui=none guifg='.s:theme.kwd

"exec 'hi typescriptAsyncFuncKeyword   gui=none guifg='.s:theme.kwd
"exec 'hi typescriptObjectAsyncKeyword gui=none guifg='.s:theme.kwd
"exec 'hi typescriptAsyncFor           gui=none guifg='.s:theme.kwd
"exec 'hi typescriptFuncKeyword        gui=none guifg='.s:theme.kwd
"exec 'hi typescriptAsyncFunc          gui=none guifg='.s:green

"exec 'hi typescriptGlobal          gui=none guifg='.s:theme.fg
"exec 'hi typescriptGlobalMethod    gui=none guifg='.s:red
"exec 'hi typescriptBOM             gui=none guifg='.s:magenta
"exec 'hi typescriptBOMWindowProp   gui=none guifg='.s:blue
"
"exec 'hi typescriptBOMWindowMethod gui=none guifg='.s:green
"exec 'hi typescriptBOMWindowCons   gui=none guifg='.s:green
"exec 'hi typescriptXHRGlobal       gui=none guifg='.s:green
"exec 'hi typescriptCryptoGlobal    gui=none guifg='.s:green
"exec 'hi typescriptGlobalMethod    gui=none guifg='.s:green
"exec 'hi typescriptEncodingGlobal  gui=none guifg='.s:green
"exec 'hi typescriptDOMEventCons    gui=none guifg='.s:green
"exec 'hi typescriptNodeGlobal      gui=none guifg='.s:green
"
"exec 'hi typescriptNumberMethod       gui=none guifg='.s:green
"exec 'hi typescriptNumberStaticProp   gui=none guifg='.s:green
"exec 'hi typescriptNumberStaticMethod gui=none guifg='.s:green

"call s:hi("tsxTagName", s:theme.keyword)
"call s:hi("tsxIntrinsicTagName", s:theme.keyword)

"" --- JavaScript --------------------------------------------------------------
"exec 'hi javaScriptNull       gui=none guifg='.s:theme.fg
"exec 'hi javaScriptType       gui=none guifg='.s:theme.fg
"exec 'hi javaScriptGlobal     gui=none guifg='.s:theme.fg
"exec 'hi javaScriptMember     gui=none guifg='.s:theme.fg
"exec 'hi javaScriptMessage    gui=none guifg='.s:theme.fg
"exec 'hi javaScriptFunction   gui=none guifg='.s:theme.kwd
"exec 'hi javaScriptIdentifier gui=none guifg='.s:theme.kwd
"exec 'hi javaScriptDeprecated gui=none guifg='.s:theme.fg
"
"" --- CSS ---------------------------------------------------------------------
"exec 'hi cssProp              gui=none guifg='.s:theme.kwd
"exec 'hi cssTagName           gui=none guifg='.s:theme.str
"exec 'hi cssClassName         gui=none guifg='.s:theme.str
"exec 'hi cssIdentifier        gui=none guifg='.s:theme.str
"exec 'hi cssAtRuleLogical     gui=none guifg='.s:theme.fg
"exec 'hi cssAttributeSelector gui=none guifg='.s:theme.fg
"
"" --- SCSS --------------------------------------------------------------------
"exec 'hi sassId                     gui=none guifg='.s:theme.str
"exec 'hi sassFor                    gui=none guifg='.s:theme.kwd
"exec 'hi sassClass                  gui=none guifg='.s:theme.str
"exec 'hi sassIdChar                 gui=none guifg='.s:theme.str
"exec 'hi sassReturn                 gui=none guifg='.s:theme.kwd
"exec 'hi sassControl                gui=none guifg='.s:theme.kwd
"exec 'hi sassAmpersand              gui=none guifg='.s:theme.str
"exec 'hi sassInterpolationDelimiter gui=none guifg='.s:theme.kwd
"
"" --- HTML --------------------------------------------------------------------
"let html_no_rendering = 1
"exec 'hi htmlArg         gui=none guifg='.s:theme.fg
"exec 'hi htmlSpecialChar gui=none guifg='.s:theme.str
"
"" --- Dart --------------------------------------------------------------------
"exec 'hi dartType     gui=none guifg='.s:theme.fg
"exec 'hi dartAssert   gui=none guifg='.s:theme.fg
"exec 'hi dartLibrary  gui=none guifg='.s:theme.kwd
"exec 'hi dartCoreType gui=none guifg='.s:theme.kwd
"
"" --- Go ----------------------------------------------------------------------
"exec 'hi goType         gui=none guifg='.s:theme.fg
"exec 'hi goFloats       gui=none guifg='.s:theme.fg
"exec 'hi goComplexes    gui=none guifg='.s:theme.fg
"exec 'hi goSignedInts   gui=none guifg='.s:theme.fg
"exec 'hi goUnsignedInts gui=none guifg='.s:theme.fg

" --- Telescope ---------------------------------------------------------------
exec 'hi TelescopeMatching gui=none guifg='.s:theme.bg 'guibg='.s:theme.kwd

" --- Plug --------------------------------------------------------------------
exec 'hi plugDeleted gui=none guifg='.s:theme.lbg

hi clear
if exists("syntax_on")
    syntax reset
endif

set background=dark
let g:colors_name = "monochrome"

" Terminal Colors
let s:red = '#e27878'
let s:cyan = '#89b8c2'
let s:blue = '#84a0c6'
let s:green = '#b4be82'
let s:white = '#c6c8d1'
let s:black = '#161821'
let s:yellow = '#e2a478'
let s:magenta = '#a093c7'

" Theme Colors
let s:bg = "#161821"
let s:lbg = "#454b68"
let s:dbg = "#0e0f15"
let s:fg = "#ebcfbc"
let s:kwd = "#dcb9a1"
let s:str = "#d4af96"

"let s:fg = "#d6cbc5"
"let s:str = "#d2a494"
"let s:kwd = "#f7d492"

" --- UI ----------------------------------------------------------------------
exec 'hi Cursor      gui=none guifg='.s:bg  'guibg='.s:white
exec 'hi CursorI     gui=none guifg='.s:bg  'guibg='.s:cyan
exec 'hi CursorR     gui=none guifg='.s:bg  'guibg='.s:yellow
exec 'hi CursorLine  gui=none guifg='.s:kwd 'guibg='.s:lbg

exec 'hi Title       gui=none guifg='.s:str 'guibg='.s:bg
exec 'hi Normal      gui=none guifg='.s:fg  'guibg='.s:bg
exec 'hi Search      gui=none                guibg='.s:kwd
exec 'hi Visual      gui=none guifg='.s:fg  'guibg='.s:lbg
exec 'hi LineNr      gui=none guifg='.s:lbg
exec 'hi NonText     gui=none guifg='.s:lbg
exec 'hi Question    gui=none guifg='.s:green
exec 'hi ErrorMsg    gui=none guifg='.s:red 'guibg='.s:bg
exec 'hi WarningMsg  gui=none guifg='.s:red 'guibg='.s:bg
exec 'hi SpecialKey  gui=none guifg='.s:lbg
exec 'hi Pmenu       gui=none guifg='.s:fg  'guibg='.s:dbg
exec 'hi PmenuSel    gui=none guifg='.s:str 'guibg='.s:lbg
exec 'hi PmenuSbar   gui=none guifg='.s:fg  'guibg='.s:lbg
exec 'hi PmenuThumb  gui=none guifg='.s:fg  'guibg='.s:str

exec 'hi Directory   gui=none guifg='.s:fg
exec 'hi VertSplit   gui=none guifg='.s:lbg 'guibg='.s:lbg
exec 'hi MatchParen  gui=none guifg='.s:kwd 'guibg='.s:lbg
exec 'hi SignColumn  gui=none                guibg='.s:bg
exec 'hi ColorColumn gui=none                guibg='.s:dbg

exec 'hi DebugR      gui=none guifg='.s:bg  'guibg='.s:red
exec 'hi DebugM      gui=none guifg='.s:bg  'guibg='.s:magenta
exec 'hi DebugB      gui=none guifg='.s:bg  'guibg='.s:blue

" --- Languages ---------------------------------------------------------------
autocmd Syntax * syn match Shebang /#!.*/
hi def link Shebang Comment

exec 'hi Constant  gui=none guifg='.s:fg
exec 'hi String    gui=none guifg='.s:str
exec 'hi Character gui=none guifg='.s:str
"exec 'hi Number    gui=none guifg='
"exec 'hi Boolean   gui=none guifg='
"exec 'hi Float     gui=none guifg='

exec 'hi Identifier gui=none guifg='.s:fg
"exec 'hi Function   gui=none guifg='

exec 'hi Statement   gui=none guifg='.s:kwd
"exec 'hi Conditional gui=none guifg='
"exec 'hi Repeat      gui=none guifg='
"exec 'hi Label       gui=none guifg='
"exec 'hi Operator    gui=none guifg='
"exec 'hi Keyword     gui=none guifg='
"exec 'hi Exception   gui=none guifg='

exec 'hi PreProc   gui=none guifg='.s:fg
"exec 'hi Include   gui=none guifg='
"exec 'hi Define    gui=none guifg='
"exec 'hi Macro     gui=none guifg='
"exec 'hi PreCondit gui=none guifg='

exec 'hi Type         gui=none guifg='.s:kwd
"exec 'hi StorageClass gui=none guifg='
"exec 'hi Structure    gui=none guifg='
"exec 'hi Typedef      gui=none guifg='

exec 'hi Special        gui=none guifg='.s:fg
"exec 'hi SpecialChar    gui=none guifg='
"exec 'hi Tag            gui=none guifg='
"exec 'hi Delimiter      gui=none guifg='
exec 'hi SpecialComment gui=none guifg='.s:lbg
"exec 'hi Debug          gui=none guifg='

exec 'hi Comment    gui=none guifg='.s:lbg
exec 'hi Todo       gui=none guifg='.s:lbg 'guibg='.s:bg
exec 'hi Underlined gui=none guifg='.s:fg
exec 'hi Ignore     gui=none guifg='.s:bg
exec 'hi Error      gui=none guifg='.s:bg  'guibg='.s:red

" --- Lightline ---------------------------------------------------------------
let s:p = {'normal': {}, 'insert': {}, 'command': {}, 'visual': {},
\          'replace': {}, 'inactive': {}, 'tabline': {}}
let s:p.normal.left = [[s:bg, s:fg], [s:fg, s:lbg]]
let s:p.normal.right = [[s:fg, s:lbg], [s:fg, s:lbg]]
let s:p.normal.middle = [[s:fg, s:dbg]]
let s:p.insert.left = [[s:bg, s:kwd], [s:fg, s:lbg]]
let s:p.command.left = [[s:bg, s:kwd], [s:fg, s:lbg]]
let s:p.visual.left = [[s:bg, s:str], [s:fg, s:lbg]]
let s:p.replace.left = [[s:bg, s:fg], [s:fg, s:lbg]]
let s:p.inactive.left = [[s:fg, s:lbg]]
let s:p.tabline.left = [[s:fg, s:dbg]]
let s:p.tabline.tabsel = [[s:fg, s:lbg]]
let s:p.tabline.middle = [[s:fg, s:dbg]]
let g:lightline#colorscheme#monochrome#palette = lightline#colorscheme#fill(s:p)

" --- Plug --------------------------------------------------------------------
exec 'hi plugDeleted gui=none guifg='.s:lbg

" --- HTML --------------------------------------------------------------------
let html_no_rendering = 1
let html_wrong_comments = 1

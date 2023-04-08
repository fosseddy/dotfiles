hi clear
if exists('syntax_on')
    syntax reset
endif

set background=dark
let g:colors_name='art'

" normal
let s:black   = '#1c1c1c' "0
let s:red     = '#a36666' "1
let s:green   = '#90a57d' "2
let s:yellow  = '#d7af87' "3
let s:blue    = '#7fa5bd' "4
let s:magenta = '#c79ec4' "5
let s:cyan    = '#8adbb4' "6
let s:white   = '#d0d0d0' "7
" light
let s:lblack   = '#4a4845' "8
let s:lred     = '#d78787' "9
let s:lgreen   = '#afbea2' "10
let s:lyellow  = '#e4c9af' "11
let s:lblue    = '#a1bdce' "12
let s:lmagenta = '#d7beda' "13
let s:lcyan    = '#b1e7dd' "14
let s:lwhite   = '#efefef' "15
" dark (termguicolors)
let s:dblack = '#121212'

" --- UI ---
exec 'hi Normal cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg='.s:white 'guibg='.s:black

exec 'hi DebugR cterm=NONE ctermfg=fg ctermbg=1 gui=NONE guifg=fg guibg='.s:lred
exec 'hi DebugG cterm=NONE ctermfg=fg ctermbg=2 gui=NONE guifg=fg guibg='.s:lgreen
exec 'hi DebugB cterm=NONE ctermfg=fg ctermbg=4 gui=NONE guifg=fg guibg='.s:lblue

"hi! link TermCursor DebugB
"hi! link Cursor	 DebugR
"hi! link lCursor	 DebugR

exec 'hi SpecialKey   cterm=NONE ctermfg=6               gui=NONE guifg='.s:cyan
exec 'hi NonText      cterm=NONE ctermfg=8               gui=NONE guifg='.s:lblack
exec 'hi Directory    cterm=NONE ctermfg=12              gui=NONE guifg='.s:blue
exec 'hi ErrorMsg     cterm=NONE ctermfg=fg ctermbg=1    gui=NONE guifg=fg           guibg='.s:red
exec 'hi LineNr       cterm=NONE ctermfg=8               gui=NONE guifg='.s:lblack
exec 'hi StatusLine   cterm=bold ctermfg=bg ctermbg=fg   gui=bold guifg=bg           guibg=fg'
exec 'hi StatusLineNC cterm=NONE ctermfg=8  ctermbg=bg   gui=NONE guifg=fg           guibg='.s:lblack
exec 'hi Visual       cterm=NONE ctermfg=bg ctermbg=3    gui=NONE guifg=fg           guibg='.s:lblack
exec 'hi ModeMsg      cterm=NONE ctermfg=fg              gui=NONE guifg=fg'
exec 'hi WildMenu     cterm=NONE ctermfg=fg ctermbg=5    gui=NONE guifg=fg           guibg='.s:lblack
exec 'hi SignColumn   cterm=NONE ctermfg=8  ctermbg=bg   gui=NONE guifg='.s:lblack  'guibg=bg'
exec 'hi Pmenu        cterm=NONE ctermfg=bg ctermbg=3    gui=NONE guifg=fg           guibg='.s:lblack
exec 'hi PmenuSel     cterm=NONE ctermfg=fg ctermbg=5    gui=NONE guifg=bg'         'guibg='.s:magenta
exec 'hi PmenuSbar    cterm=NONE            ctermbg=3    gui=NONE                    guibg='.s:dblack
exec 'hi PmenuThumb   cterm=NONE            ctermbg=5    gui=NONE                    guibg=fg'
exec 'hi ColorColumn  cterm=NONE            ctermbg=1    gui=NONE                    guibg='.s:dblack
exec 'hi WinSeparator cterm=NONE ctermfg=bg ctermbg=fg   gui=NONE guifg='.s:black   'guibg=fg'
exec 'hi IncSearch    cterm=NONE ctermfg=fg ctermbg=5    gui=NONE guifg=bg           guibg='.s:magenta
exec 'hi Search       cterm=NONE ctermfg=5  ctermbg=NONE gui=NONE guifg='.s:magenta 'guibg=NONE'
exec 'hi CursorLine   cterm=NONE ctermfg=5               gui=NONE                    guibg='.s:lblack
exec 'hi TabLine      cterm=NONE ctermfg=8  ctermbg=bg   gui=NONE guifg=fg           guibg='.s:dblack
exec 'hi TabLineSel   cterm=NONE ctermfg=bg ctermbg=fg   gui=NONE guifg=fg           guibg='.s:lblack
exec 'hi MoreMsg      cterm=NONE ctermfg=2               gui=NONE guifg='.s:green
exec 'hi Question     cterm=NONE ctermfg=2               gui=NONE guifg='.s:green
exec 'hi WarningMsg   cterm=NONE ctermfg=3               gui=NONE guifg='.s:yellow
exec 'hi Title        cterm=NONE ctermfg=5               gui=NONE guifg='.s:magenta 'guibg=bg'
exec 'hi Folded       cterm=NONE ctermfg=6  ctermbg=bg   gui=NONE guifg='.s:cyan    'guibg=bg'

hi! link CursorLineNr CursorLine
hi! link CursorColumn CursorLine
hi! link TabLineFill  TabLine
hi! link FoldColumn   Folded

hi! link DiffAdd    DebugB
hi! link DiffChange DebugG
hi! link DiffDelete DebugR
hi! link DiffText   DebugB

hi! link SpellBad   DebugR
hi! link SpellCap   DebugB
hi! link SpellRare  DebugG
hi! link SpellLocal DebugG

" --- Languages ---
exec 'hi Underlined cterm=underline ctermfg=fg              gui=underline guifg=fg'
exec 'hi MatchParen cterm=NONE      ctermfg=5  ctermbg=NONE gui=NONE      guifg=fg guibg='.s:lblack

exec 'hi Comment    cterm=NONE ctermfg=8  gui=NONE guifg='.s:lblack
exec 'hi String     cterm=NONE ctermfg=2  gui=NONE guifg='.s:green
exec 'hi Constant	cterm=NONE ctermfg=fg gui=NONE guifg=fg'
exec 'hi Identifier cterm=NONE ctermfg=fg gui=NONE guifg=fg'
exec 'hi Statement  cterm=NONE ctermfg=fg gui=NONE guifg=fg'
exec 'hi PreProc    cterm=NONE ctermfg=fg gui=NONE guifg=fg'
exec 'hi Type       cterm=NONE ctermfg=fg gui=NONE guifg=fg'
exec 'hi Special    cterm=NONE ctermfg=fg gui=NONE guifg=fg'

hi! link Todo Comment

" --- NERDTree ---
exec 'hi NERDTreeExecFile cterm=NONE ctermfg=2 gui=NONE guifg='.s:green
exec 'hi NERDTreeLinkFile cterm=NONE ctermfg=6 gui=NONE guifg='.s:cyan

" --- Telescope ---
hi! link TelescopeMatching IncSearch

" --- HTML ---
let html_no_rendering = 1
let html_wrong_comments = 1

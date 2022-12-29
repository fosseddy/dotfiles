hi clear
if exists('syntax_on')
    syntax reset
endif

set background=dark
let g:colors_name='art'

" Terminal Colors
" black   0 8
" red     1 9
" green   2 10
" yellow  3 11
" blue    4 12
" magenta 5 13
" cyan    6 14
" white   7 15
" --- UI ----------------------------------------------------------------------
hi Normal cterm=NONE ctermfg=7  ctermbg=0

hi DebugR cterm=NONE ctermfg=bg ctermbg=9
hi DebugG cterm=NONE ctermfg=bg ctermbg=10
hi DebugB cterm=NONE ctermfg=bg ctermbg=12

hi! link TermCursor	DebugR
hi! link Cursor	    DebugR
hi! link lCursor	DebugR

hi SpecialKey   cterm=NONE ctermfg=6
hi NonText      cterm=NONE ctermfg=8
hi Directory    cterm=NONE ctermfg=4
hi ErrorMsg     cterm=NONE ctermfg=fg ctermbg=1
hi LineNr       cterm=NONE ctermfg=8
hi StatusLine   cterm=bold ctermfg=bg ctermbg=fg
hi StatusLineNC cterm=NONE ctermfg=fg ctermbg=8
hi Visual       cterm=NONE ctermfg=fg ctermbg=8
hi ModeMsg      cterm=NONE ctermfg=fg
hi WildMenu     cterm=NONE ctermfg=fg ctermbg=8
hi SignColumn   cterm=NONE ctermfg=8  ctermbg=bg
hi Pmenu        cterm=NONE ctermfg=fg ctermbg=8
hi PmenuSel     cterm=NONE ctermfg=bg ctermbg=fg
hi PmenuSbar    cterm=NONE            ctermbg=bg
hi PmenuThumb   cterm=NONE            ctermbg=fg
hi ColorColumn  cterm=NONE            ctermbg=8
hi WinSeparator cterm=NONE ctermfg=8  ctermbg=fg
hi IncSearch    cterm=NONE ctermfg=bg ctermbg=3
hi Search       cterm=NONE ctermfg=bg ctermbg=fg
hi CursorLine   cterm=NONE ctermfg=fg ctermbg=8
hi TabLine      cterm=NONE ctermfg=fg ctermbg=8
hi TabLineSel   cterm=NONE ctermfg=bg ctermbg=fg
hi MoreMsg      cterm=NONE ctermfg=2
hi Question     cterm=NONE ctermfg=2
hi WarningMsg   cterm=NONE ctermfg=3
hi Title        cterm=NONE ctermfg=5
hi Folded       cterm=NONE ctermfg=6  ctermbg=bg

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

" Terminal Colors
" black   0 8
" red     1 9
" green   2 10
" yellow  3 11
" blue    4 12
" magenta 5 13
" cyan    6 14
" white   7 15
" --- Languages ---------------------------------------------------------------
autocmd Syntax * syn match Shebang /#!.*/
hi def link Shebang Comment

hi Underlined cterm=underline ctermfg=fg
hi MatchParen cterm=NONE      ctermbg=8
hi Comment    cterm=NONE ctermfg=8
hi String     cterm=NONE ctermfg=2
hi Constant	  cterm=NONE ctermfg=fg
hi Identifier cterm=NONE ctermfg=fg
hi Statement  cterm=NONE ctermfg=fg	
hi PreProc    cterm=NONE ctermfg=fg	
hi Type       cterm=NONE ctermfg=fg	

hi! link Todo           Comment
hi! link Special        String
hi! link Error          ErrorMsg
"hi! link SpecialChar    String
"hi! link Character      String
"hi! link SpecialComment String

"NERD Tree
hi NERDTreeExecFile cterm=NONE ctermfg=2
hi NERDTreeLinkFile cterm=NONE ctermfg=6

" --- Telescope ---------------------------------------------------------------
hi! link TelescopeMatching IncSearch

" --- HTML --------------------------------------------------------------------
let html_no_rendering = 1
let html_wrong_comments = 1

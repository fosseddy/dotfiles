let g:lightline = {
\   'colorscheme': 'monochrome',
\   'tabline': {
\       'left': [[ 'tabs' ]],
\       'right': [['']]
\   },
\   'tab': {
\       'active': [ 'tabnum', 'filename', 'modified' ],
\       'inactive': [ 'tabnum', 'filename', 'modified' ]
\   }
\ }

colorscheme monochrome

set guicursor=a:block-blinkwait400-blinkon600-blinkoff400-Cursor,
             \i:block-blinkwait400-blinkon600-blinkoff400-CursorI,
             \r:block-blinkwait400-blinkon600-blinkoff400-CursorR

set guifont=CodeNewRoman\ 14
set guioptions="c"

source $VIMRUNTIME/defaults.vim

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

Plug 'garbas/vim-snipmate'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:snipMate = { 'snippet_version' : 1 }

let g:lightline = {
\   'tabline': {
\       'left': [[ 'tabs' ]],
\       'right': [['']]
\   },
\   'tab': {
\       'active': [ 'tabnum', 'filename', 'modified' ],
\       'inactive': [ 'tabnum', 'filename', 'modified' ]
\   }
\}

if has("gui_running")
    colorscheme monochrome
    let g:lightline.colorscheme = 'monochrome'
    set guifont=CodeNewRoman\ 14
    set guioptions="c"
    set guicursor=a:block-blinkwait400-blinkon600-blinkoff400-Cursor,
                 \i:block-blinkwait400-blinkon600-blinkoff400-CursorI,
                 \r:block-blinkwait400-blinkon600-blinkoff400-CursorR
else
    colorscheme habamax
    let g:lightline.colorscheme = 'srcery_drk'
endif

set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set relativenumber
set noshowmode
set tabpagemax=5
set noerrorbells
set hidden
set nohlsearch
set signcolumn=yes
set colorcolumn=80
set scrolloff=20
set list
set listchars=trail:·,tab:·\ 
set splitbelow
set splitright
set wildoptions=pum
set shortmess-=S

let g:mapleader = ' '

nnoremap <leader>fs :Rg <c-r><c-w><cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>

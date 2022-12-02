source $VIMRUNTIME/defaults.vim

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-utils/vim-man'
call plug#end()

let g:snipMate = { 'snippet_version' : 1 }

let g:lightline = {
\   'colorscheme': 'srcery_drk',
\   'tabline': {
\       'left': [[ 'tabs' ]],
\       'right': [['']]
\   },
\   'tab': {
\       'active': [ 'tabnum', 'filename', 'modified' ],
\       'inactive': [ 'tabnum', 'filename', 'modified' ]
\   }
\}

colorscheme habamax

if has("gui_running")
    colorscheme monochrome
    let g:lightline.colorscheme = 'monochrome'
    set guifont=CodeNewRoman\ 13
    set guioptions="c"
    set guicursor=a:block-blinkwait400-blinkon600-blinkoff400-Cursor,
                 \i:block-blinkwait400-blinkon600-blinkoff400-CursorI,
                 \r:block-blinkwait400-blinkon600-blinkoff400-CursorR
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

nnoremap <silent><leader>fs :Rg <c-r><c-w><cr>
nnoremap <silent><leader>fg :Rg<cr>
nnoremap <silent><leader>ff :Files<cr>
nnoremap <silent><leader>fb :Buffers<cr>

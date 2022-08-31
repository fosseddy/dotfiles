call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'itchyny/lightline.vim'

Plug 'digitaltoad/vim-pug'

Plug 'L3MON4D3/luasnip'
call plug#end()

set termguicolors
colorscheme monochrome

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

lua << EOF
require('luasnip').config.set_config({
  history = false,
  updateevents = 'TextChangedI'
})
EOF

lua << EOF
require('luasnip/loaders/from_vscode').load({
  paths = {'/home/fosseddy/.config/nvim/snippets'}
})
EOF

lua << EOF
require('telescope').setup {
  defaults = {
      file_ignore_patterns = {'node_modules'}
  },
  pickers = {
    find_files = {
      theme = 'dropdown'
    },
    live_grep = {
      theme = 'dropdown'
    },
    grep_string = {
      theme = 'dropdown'
    },
    buffers = {
      theme = 'dropdown'
    }
  }
}
EOF

set tabstop=2
set shiftwidth=2
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

set guicursor=a:block-blinkwait300-blinkon200-blinkoff150-Cursor,i:CursorI,r:CursorR

let mapleader = ' '

" Telescope
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string()<cr>

" Popup menu
inoremap <expr> <Tab> pumvisible() ? '\<C-n>' : '\<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<S-Tab>'

" LuaSnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
nnoremap <leader>ss :LuaSnipUnlinkCurrent<cr>

autocmd VimLeave * set guicursor=a:block

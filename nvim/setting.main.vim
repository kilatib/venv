syntax on

set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menu,noinsert,noselect
set signcolumn=yes

set clipboard+=unnamedplus

colorscheme gruvbox
if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <space>e :CocCommand explorer<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

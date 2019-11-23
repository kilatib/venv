


"
" INSTALL PLUGINS
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'

" theme 
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Fundamental settings
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
  set fileformat=unix
  set fileformats=unix,dos,mac
  filetype on
  filetype plugin on
  filetype plugin indent on
  syntax on
" Some useful settings
  set smartindent
  set expandtab         "tab to spaces
  set tabstop=2         "the width of a tab
  set shiftwidth=2      "the width for indent
  set foldenable
  set foldmethod=indent "folding by indent
  set foldlevel=99
  set ignorecase        "ignore the case when search texts
  set smartcase         "if searching text contains uppercase case will not be ignored
" Lookings
  set number           "line number
  set nowrap           "no line wrapping
  colorscheme dracula


"
"Plugin settings
"

" NerdTree
" open automaticaly on start files
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" save open session
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" close when left only right menu
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ignore
  set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,node_modules,tags
  let NERDTreeRespectWildIgnore=1

" key maps 
  map <F12> :NERDTreeToggle<CR>


" CtrlP
  "let g:ctrlp_map = '<C-S>o'
  let g:ctrlp_cmd = 'CtrlP'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Ignore Dirs
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	  \ 'file': '\v\.(exe|so|dll)$',
	  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	  \ }

" Prettier
" 
" run async
  let g:prettier#exec_cmd_async = 1
  map <C-l> :Prettier<CR>


"  
" Deoplete
"
  let g:deoplete#enable_at_startup = 1

"
" syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

"
" Vim-javascript
  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_ngdoc = 1
  let g:javascript_plugin_flow = 1

  augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
  augroup END

"
" TagBar
  nmap <F8> :TagbarToggle<CR>

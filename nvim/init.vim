"
" INSTALL PLUGINS
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'honza/vim-snippets'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
  Plug 'tpope/vim-fugitive'

" IDE autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

" theme 
  Plug 'dracula/vim', { 'as': 'dracula' }

" tmnux syntax
  Plug 'tmux-plugins/vim-tmux'
  Plug 'christoomey/vim-tmux-navigator'   " tmux navigation 
  Plug 'vim-airline/vim-airline'          " status line 
  Plug 'vim-airline/vim-airline-themes'   " status line themes

" PHP
  Plug 'vim-vdebug/vdebug'
  Plug 'dbakker/vim-projectroot'
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
  nmap <C-Right> :vertical res +10<CR>
  nmap <C-Left> :vertical res -10<CR>

" CtrlP
  "let g:ctrlp_map = '<C-S>o'
  let g:ctrlp_cmd = 'CtrlP'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Ignore Dirs
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
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

" Tabs settings
  nnoremap <C-t>     :tabnew<CR>
  inoremap <C-tab>   <Esc>:tabnext<CR>i
  inoremap <C-W>   <Esc>:tabclose<CR>
  nnoremap <A-F1> 1gt
  nnoremap <A-F2> 2gt
  nnoremap <A-F3> 3gt
  nnoremap <A-F4> 4gt
  nnoremap <A-F5> 5gt
  nnoremap <A-F6> 6gt
  nnoremap <A-F7> 7gt
  nnoremap <A-F8> 8gt
  nnoremap <A-F9> 9gt
  nnoremap <A-F10> 10gt
  map <C-W> :tabclose<CR>

" Airline
  let g:airline#extensions#tabline#enabled = 1
" tabline   
  map <tab> :bnext<CR>
  map <S-tab> :bprev<CR>
  let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
  let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
  let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
  let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline 
  nnoremap <leader>d :bd#<CR>

" Ctags
  au BufWritePost *.php,*.ts,*.js,*.json,*.html silent! !ctags -R &

" add some tags for html indentations
  let g:html_indent_inctags = "html,body,head,tbody"

" PROJECTROOT
  let g:rootmarkers = ['.projectroot', 'docker-compose.yml', '.git', '.hg', '.svn', '.bzr','_darcs','build.xml']

" VDEBUG
  let g:vdebug_options = {
    \  'break_on_open':      0,                 
    \  'watch_window_style': 'compact',    
    \  'server':             'docker.for.mac.localhost', 
    \  'path_maps': {
    \  '/opt/checkster/core': '~/src/core'
    \ }
  \}

" Coc settings
source ~/.config/nvim/coc.plugin.vim




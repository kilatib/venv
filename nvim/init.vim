"
" INSTALL PLUGINS
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html'
    \ ]}
  Plug 'vim-syntastic/syntastic'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-fugitive'

" IDE autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'shawncplus/phpcomplete.vim'    
  Plug 'StanAngeloff/php.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clang-completer'}
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


" Unit Tests
  Plug 'janko/vim-test' 

" theme 
  " Plug 'dracula/vim', { 'as': 'dracula' }
  " Plug 'blueshirts/darcula'
  Plug 'doums/darcula'

" tmnux syntax
  Plug 'tmux-plugins/vim-tmux'
  Plug 'christoomey/vim-tmux-navigator'   " tmux navigation 
  Plug 'vim-airline/vim-airline'          " status line 
  Plug 'vim-airline/vim-airline-themes'   " status line themes

" PHP
  Plug 'vim-vdebug/vdebug'
  Plug 'dbakker/vim-projectroot'
  Plug 'StanAngeloff/php.vim', {'for': 'php'}
  Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
  Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
  Plug 'majutsushi/tagbar'

" toml syntax highlighting
  Plug 'cespare/vim-toml'
  Plug 'itchyny/lightline.vim'

" Plug to dim not-focused windows
  Plug 'blueyed/vim-diminactive'


" fzf - poweful fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

" display the hexadecimal colors - useful for css and color config
  Plug 'ap/vim-css-color' 

" CSV plugin
  Plug 'chrisbra/csv.vim'  
" Word search
  Plug 'mileszs/ack.vim'
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
  set tabstop=4         "the width of a tab
  set shiftwidth=4      "the width for indent
  set foldenable
  set foldmethod=indent "folding by indent
  set foldlevel=99
  set ignorecase        "ignore the case when search texts
  set smartcase         "if searching text contains uppercase case will not be ignored
" Lookings
  set number           "line number
  set nowrap           "no line wrapping
  colorscheme darcula
  "set termguicolors
  let g:lightline = { 'colorscheme': 'darculaOriginal' } 
" show unreddable symbols 
  "set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
  set list
  set mouse +=a
  set clipboard=unnamedplus
  map <leader>c "+y
  map <leader>v "+P
  map <D-c> "+y
  map <D-v> "+P
  map <M-c> "+y
  map <M-v> "+P 

  


  
" Reloads the vim config after saving.
   augroup myvimrc
     au!
     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
   augroup END


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
  let NERDTreeShowHidden=1

" key maps 
  map <F12> :NERDTreeToggle<CR>
  nmap <C-Right> :vertical res +10<CR>
  nmap <C-Left> :vertical res -10<CR>
  nmap <leader><Right> :vertical res +10<CR>
  nmap <leader><Left> :vertical res -10<CR>
  nmap <leader>r :NERDTreeFind<cr>

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
  set statusline+=%{FugitiveStatusline()}
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
  nnoremap <leader>d :bp<CR> :bd#<CR>

  let g:airline#extensions#tabline#buffer_idx_mode = 1
  
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9


" Ctags
  au BufWritePost *.php,*.ts,*.js,*.json,*.html silent! !ctags -R &

" add some tags for html indentations
  let g:html_indent_inctags = "html,body,head,tbody"

" PROJECTROOT
  let g:rootmarkers = ['codeception.yml','.projectroot', 'docker-compose.yml', '.git', '.hg', '.svn', '.bzr','_darcs', 'build.xml']

" VDEBUG
 if !exists('g:vdebug_options')
    let g:vdebug_options = {}
 endif

 "let g:vdebug_options["server"]= 'docker.for.mac.localhost' 
 let g:vdebug_options["timeout"]= 20 
 let g:vdebug_options["on_close"]= 'detach'
 let g:vdebug_options["break_on_open"]= 0
 let g:vdebug_options["ide_key"]= 'PHPSTORM'
 let g:vdebug_options["path_maps"]=  {'/opt/checkster/core' : '/Users/checkster/src/core'}
 let g:vdebug_options["debug_window_level"]= 0
 let g:vdebug_options["debug_file_level"]= 0
 let g:vdebug_options["debug_file"]= ''
 let g:vdebug_options["watch_window_style"]= 'compact'
 let g:vdebug_options["watch_window_height"]= 45
 let g:vdebug_options["marker_default"]= '⬦' 
 let g:vdebug_options["marker_closed_tree"]= '▸'
 let g:vdebug_options["marker_open_tree"]= '▾'

" Coc settings
  source ~/.config/nvim/coc.plugin.vim

" Use deoplete.
  let g:deoplete#enable_at_startup = 1

" Ctrl-S save
  noremap <silent> <C-S>          :update<CR>
  vnoremap <silent> <C-S>         <C-C>:update<CR>
  inoremap <silent> <C-S>         <C-O>:update<CR>

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
  nmap <silent> t<C-n> :TestNearest<CR>
  nmap <silent> t<C-f> :TestFile<CR>
  nmap <silent> t<C-s> :TestSuite<CR>
  nmap <silent> t<C-l> :TestLast<CR>
  nmap <silent> t<C-g> :TestVisit<CR>

" tagbar
  nmap <F8> :TagbarToggle<CR>

" vim-fugitive
   map <leader>gb :Gblame<CR>
   map <leader>gd :Gvdiffsplit!<CR>
   map <leader>gs :Gstatus<CR>
   map <leader>gp :Gpull<CR>
   map <leader>gpu :Gpush<CR>
   map <leader>gcl :Gclog<CR>
   map <leader>gl :Gllog<CR>
   map <leader>g<Right> :diffget //2<CR> :diffupdate<CR>
   map <leader>g<Left> :diffget //3<CR> :diffupdate<CR>
   map <leader>gu :diffupdate<CR>
   map <leader>gw :Gwrite<CR>
   map <leader>gc :Gcommit<CR>

" Search word
  cnoreabbrev Ack Ack!
  nnoremap <Leader>a :Ack!<Space>

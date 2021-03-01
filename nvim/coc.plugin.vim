
" Coc def
"'' Conquer of Completion (CoC) ''"
if filereadable(expand("~/.vim/plugged/coc.nvim/plugin/coc.vim"))
  let g:coc_global_extensions=[
      \'coc-actions',
      \'coc-angular',
      \'coc-css',
      \'coc-cssmodules',
      \'coc-docker',
      \'coc-highlight',
      \'coc-html',
      \'coc-json',
      \'coc-markdownlint',
      \'coc-prettier',
      \'coc-sh',
      \'coc-sql',
      \'coc-tabnine',
      \'coc-tailwindcss',
      \'coc-tsserver',
      \'coc-yaml',
      \'coc-snippets',
      \'coc-pairs',
      \'coc-eslint',
      \'coc-phpls',
      \'coc-explorer'
      \]
    nnoremap <space>e :CocCommand explorer<CR>

  " Explorer
  let g:coc_explorer_global_presets = {
  \   '.vim': {
  \     'root-uri': '~/.vim',
  \   },
  \   'tab': {
  \     'position': 'tab',
  \     'quit-on-open': v:true,
  \   },
  \   'floating': {
  \     'position': 'floating',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingTop': {
  \     'position': 'floating',
  \     'floating-position': 'center-top',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingLeftside': {
  \     'position': 'floating',
  \     'floating-position': 'left-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingRightside': {
  \     'position': 'floating',
  \     'floating-position': 'right-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'simplify': {
  \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   }
  \ }

  nmap <space>e :CocCommand explorer<CR>
  nmap <space>f :CocCommand explorer --preset floating<CR>
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
endif



" See :h fzf-checkout for a list of all available commands and settings.
let g:fzf_command_prefix = ''
let g:fzf_checkout_git_options = '--sort=-committerdate'
let g:fzf_branch_actions = {
      \ 'delete': {'keymap': 'ctrl-r'},
      \}
let g:fzf_tag_actions = {
      \ 'checkout': {'execute': '!{git} checkout {branch}'},
      \}
let g:fzf_branch_actions = {
      \ 'diff': {
      \   'prompt': 'Diff> ',
      \   'execute': 'Git diff {branch}',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-f',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}


nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>


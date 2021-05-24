" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>

let test#php#codeception#executable = 'docker exec -w /opt/checkster/core -it src_frontend_1 /usr/sbin/codecept -c ./codeception.yml '

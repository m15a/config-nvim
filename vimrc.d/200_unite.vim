let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
" Key maps
let g:unite_data_directory = $HOME.'/.vim/cache/unite'
nnoremap <Leader>e :<C-u>Unite -auto-resize buffer file<CR>
nnoremap <Leader>f :<C-u>Unite -auto-resize line<CR>
nnoremap <Leader>g :<C-u>Unite -auto-resize grep:.<CR>
nnoremap <Leader>G :<C-u>Unite -auto-resize grep:.<CR><C-R><C-W>
nnoremap <leader>y :<C-u>Unite -auto-resize history/yank<CR>
nnoremap <leader>R :<C-u>UniteResume -auto-resize<CR>

" Unite grep に ag (The Silver Searcher) を使う
if executable ('ag')
  let g:unite_source_grep_command       = 'ag'
  let g:unite_source_grep_default_opts  = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
"" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')

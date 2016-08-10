Plug 'rtakasuke/yanktmp.vim'

let g:yanktmp_file      = g:cache_home.'/yanktmp'
let g:yanktmp_mode_file = g:cache_home.'/yanktmp_mode'

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

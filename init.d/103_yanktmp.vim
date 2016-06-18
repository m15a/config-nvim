let g:yanktmp_file = $HOME.'/.vim/cache/yanktmp'
nnoremap <silent> sy :call YanktmpYank()<CR>
vnoremap <silent> sy :call YanktmpYank()<CR>
nnoremap <silent> sp :call YanktmpPaste_p()<CR>
vnoremap <silent> sp :call YanktmpPaste_p()<CR>
nnoremap <silent> sP :call YanktmpPaste_P()<CR>
vnoremap <silent> sP :call YanktmpPaste_P()<CR>

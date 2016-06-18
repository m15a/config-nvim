let g:yanktmp_file      = g:nvim_cache.'/yanktmp'
let g:yanktmp_mode_file = g:nvim_cache.'/yanktmp_mode'

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

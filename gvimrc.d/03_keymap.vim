"" Toggle fullscreen
function! ToggleFullScreen ()
  if &g:fullscreen
    set nofullscreen
  else
    set fullscreen
  endif
endfunction
nnoremap <silent> <Leader>m :call ToggleFullScreen ()<CR>

"" Toggle fullscreen
function! FullScreenToggle()
  if &g:fullscreen
    set nofullscreen
  else
    set fullscreen
  endif
endfunction
nnoremap <silent> <Leader>m :call FullScreenToggle()<CR>

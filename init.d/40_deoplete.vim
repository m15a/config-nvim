let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_camel_case = 1

"" Key maps
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <expr><C-h> deoplete#smart_close_popup() . "\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup() . "\<C-h>"
inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-l> deoplete#refresh()

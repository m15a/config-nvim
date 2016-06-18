"" Options
let g:neocomplete#enable_at_startup     = 1
let g:neocomplete#enable_auto_select    = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_smart_case     = 1
let g:neocomplete#ctags_command         = '/opt/local/bin/jexctags'

"" Key maps
inoremap <expr><C-g> neocomplete#undo_completion ()
inoremap <expr><C-l> neocomplete#complete_common_string ()
inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_function ()<CR>
function! s:neocomplete_cr_function ()
  return neocomplete#close_popup () . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"" Initializings
if !exists ('g:neocomplete#ctags_arguments')
  let g:neocomplete#ctags_arguments = {}
endif
if !exists ('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists ('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

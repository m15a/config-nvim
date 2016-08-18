" deoplete.nvim {{{

let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_camel_case = 1

"" Key maps
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction
inoremap <expr><C-h> deoplete#smart_close_popup() . "\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup() . "\<C-h>"
inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-l> deoplete#refresh()

augroup nvimrc_deoplete
  autocmd!
  au VimEnter,ColorScheme * hi PmenuSel guifg=#282c34 guibg=#abb2bf
augroup END

"}}}
" neosnippet {{{

let g:neosnippet#snippets_directory = g:nvimrc_config_home . '/snippets'

"" Key maps
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)

"" For snippet_complete marker
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"}}}

" vim: foldmethod=marker

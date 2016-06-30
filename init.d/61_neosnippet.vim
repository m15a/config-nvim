Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'

"" Key maps
imap <C-s>   <Plug>(neosnippet_expand_or_jump)
smap <C-s>   <Plug>(neosnippet_expand_or_jump)
xmap <C-s>   <Plug>(neosnippet_expand_target)
xmap <C-l>   <Plug>(neosnippet_start_unite_snippet_target)

"" SuperTab like snippets behavior
imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet#expand_or_jump)" : "\<TAB>"

"" For snippet_complete marker
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

scriptencoding utf-8

" nvim-miniyank {{{

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

map <leader>n <Plug>(miniyank-cycle)

"}}}
" vim-autoclose {{{

"" Disable this mapping because vim-surround does it and tabular use <Leader>a
let g:AutoCloseSelectionWrapPrefix = ''

"}}}
" CamelCaseMotion {{{

"" Replace the default 'w', 'b', and 'e' mappings
map <silent> w  <Plug>CamelCaseMotion_w
map <silent> b  <Plug>CamelCaseMotion_b
map <silent> e  <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

"" Replace default 'iw' text-object and define 'ib' and 'ie' motions
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

"}}}
" tabular {{{

nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
nnoremap <Leader>a> :Tabularize /=><CR>
vnoremap <Leader>a> :Tabularize /=><CR>

"}}}
" clever-f.vim {{{

let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1

let g:clever_f_not_overwrites_standard_mappings = 1
nmap f <Plug>(clever-f-f)
xmap f <Plug>(clever-f-f)
omap f <Plug>(clever-f-f)
nmap F <Plug>(clever-f-F)
xmap F <Plug>(clever-f-F)
omap F <Plug>(clever-f-F)
nmap t <Plug>(clever-f-t)
xmap t <Plug>(clever-f-t)
omap t <Plug>(clever-f-t)
nmap T <Plug>(clever-f-T)
xmap T <Plug>(clever-f-T)
omap T <Plug>(clever-f-T)

"}}}
" nerdcommenter {{{

"" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"" Set languages to use its alternate delimiters by default
let g:NERDAltDelims_haskell = 1

"}}}
" tagbar {{{

nnoremap <Leader>l :<C-u>TagbarToggle<CR>

let g:tagbar_width = 28
" let g:tagbar_autoclose = 1
" let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_expand = 1
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autoshowtag = 1

"}}}
" nerdtree {{{

nnoremap <Leader>t :<C-u>NERDTreeToggle<CR>
augroup nvimrc_nerdtree
  autocmd!
  au FileType nerdtree nnoremap <buffer> b :<C-u>Bookmark<CR>
augroup END

let g:NERDTreeWinSize = 24
let g:NERDTreeCaseSensitiveSort = 1
" let g:NERDTreeHijackNetrw = 0
" let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeIgnore = ['\~$', '^\.git$[[dir]]', '^\.hg$[[dir]]', '^_darcs$[[dir]]']
let g:NERDTreeBookmarksFile = g:nvimrc_data_home . '/nerdtree_bookmarks'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1

"}}}
" neomake {{{

nnoremap <Leader>r :<C-u>Neomake<CR>
nnoremap <Leader>R :<C-u>Neomake!<CR>

"}}}
" timestamp.vim {{{

let g:nvimrc_timestamp_datetime_regexp =
      \   '\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2} ?%(<\u{2,3}>|[\+\-]\d{2}:?\d{2})?'
      \ . '|TIMESTAMP'

let g:timestamp_rep = '%Y-%m-%d %H:%M:%S %Z'
let g:timestamp_regexp =
      \   '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)@<='
      \ . g:nvimrc_timestamp_datetime_regexp

"}}}

" vim: foldmethod=marker

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

let g:clever_f_mark_char_color = 'Search'

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
"{{{ denite.nvim

"" Change file_rec command
" call denite#custom#var('file_rec', 'command',
"       \ ['rg', '--files', '-g', '!.git', '!.hg', '!_darcs'])

"" Ripgrep command on grep source
if executable('rg')
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

"" Convert candidate's word to the relative path.
call denite#custom#source('file_mru', 'converters',
      \ ['converter_relative_word'])

"" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.hg/', '_darcs/',
      \ ])

"" Key maps
noremap [unite] <Nop>
map <Leader>u [unite]
nmap <silent> [unite]e :<C-u>Denite buffer file_rec -buffer-name=search-buffer-denite<CR>
nmap <silent> [unite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
"" See http://qiita.com/pocari/items/1b76c211d5555fa87834
nmap <silent> [unite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
nmap <silent> [unite][ :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
nmap <silent> [unite]] :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
call denite#custom#map(
      \ 'insert',
      \ '<C-a>',
      \ '<denite:choose_action>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<Tab>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map('insert', '<C-n>', '<Tab>')
call denite#custom#map(
      \ 'insert',
      \ '<S-Tab>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map('insert', '<C-p>', '<S-Tab>')

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

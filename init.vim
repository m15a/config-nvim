scriptencoding utf-8

"" Set base directories before loading init scripts
let s:config_home = (exists('$XDG_CONFIG_HOME') ? $XDG_CONFIG_HOME : $HOME . '/.config') . '/nvim'
let s:data_home = (exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . '/.local/share') . '/nvim'
let s:cache_home = (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME . '/.cache') . '/nvim'

if exists('*minpac#init') "{{{1
  call minpac#init({'dir': s:data_home . '/site'})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "" Text objects
  call minpac#add('glts/vim-textobj-comment')
  call minpac#add('kana/vim-textobj-indent')
  call minpac#add('kana/vim-textobj-user')  " required by the other textobj plugins

  "" UI enhancements
  call minpac#add('dense-analysis/ale')
  call minpac#add('lotabout/skim.vim')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('houtsnip/vim-emacscommandline')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('thinca/vim-visualstar')

  "" Japanese settings
  call minpac#add('fuenor/JpFormat.vim')

  "" Language extensions
  call minpac#add('aliou/bats.vim')
  call minpac#add('JuliaEditorSupport/julia-vim')
  call minpac#add('jalvesaq/Nvim-R')
  call minpac#add('maverickg/stan.vim')
  call minpac#add('mnacamura/vim-fish')
  call minpac#add('arnoudbuzing/wolfram-vim')
  call minpac#add('vim-pandoc/vim-pandoc-syntax')
  call minpac#add('vim-pandoc/vim-rmarkdown')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('racer-rust/vim-racer')
  call minpac#add('baskerville/vim-sxhkdrc')
  call minpac#add('cespare/vim-toml')

  "" Applications inside Vim
  call minpac#add('vimwiki/vimwiki')

  " Sorted by repo name: `:'<,'>sort /\v^[^\/]+\//`
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

"" UI enhancements {{{1

"" Practical Vim, Tip 42: '%%' expands to '%:h'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

"" Practical Vim, Tip 93: Repeat the last substitution by '&'
nnoremap & :&&<CR>
xnoremap & :&&<CR>

augroup remember_last_cursor_position
  autocmd!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exec "normal g`\"" |
        \ endif
augroup END

"" Colorize columns over &textwidth
exec 'set colorcolumn=+' . join(range(1, 256), ',+')

"" Use ripgrep if available
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"" Modern Vim, Tip 12: ALE mappings in the style of unimpaired
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"" Skim key mappings
noremap [skim] <Nop>
map <Leader>e [skim]
nmap [skim]f :<C-u>Files ./<CR>
nmap [skim]F :<C-u>Files 
nmap <silent> [skim]g :<C-u>GFiles<CR>
nmap <silent> [skim]G :<C-u>GFiles?<CR>
nmap <silent> [skim]b :<C-u>Buffers<CR>
nmap [skim]L :<C-u>Lines 
nmap [skim]l :<C-u>BLines 
nmap [skim]T :<C-u>Tags 
nmap [skim]t :<C-u>BTags 
nmap <silent> [skim]m :<C-u>Marks<CR>  " TODO: Marks does not work!
nmap <silent> [skim]h :<C-u>History<CR>  " TODO: History does not work!
nmap <silent> [skim]: :<C-u>History:<CR>
nmap <silent> [skim]/ :<C-u>History/<CR>
" nmap <silent> [skim]c :<C-u>Commits<CR>  " fugative.vim is required
" nmap <silent> [skim]C :<C-u>BCommits<CR>  " fugative.vim is required
" nmap <silent> [skim]: :<C-u>Commands<CR>  " TODO: Conflicts with History:

"" Tagbar settings
let g:tagbar_singleclick = 1
let g:tagbar_autoclose = 1
nmap <silent> <Leader>l :TagbarToggle<CR>

" See https://vim.fandom.com/wiki/Insert_current_date_or_time
fun! UpdateTimestamp(format)
  if !&modified | return | endif
  let l:pos = getpos('.')
  let l:n = min([10, line('$')])
  let l:date = strftime(a:format)
  if match(getline(1, l:n), l:date) > -1 | return | endif
  let l:cmd = '1,' . l:n . 's#\v\c(Last %(Change|Modified): ).*#\1' . l:date . '#e'
  keepj exec l:cmd
  call histdel('search', -1)
  call setpos('.', l:pos)
endfun
augroup update_timestamp
  autocmd!
  au BufWritePre * call UpdateTimestamp('%Y-%m-%d')
augroup END

"" Japanese settings {{{1

set ambiwidth=double  " □や○の文字があってもカーソル位置がずれないようにする。
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set formatoptions+=mB  " 日本語の行同士の連結には空白を入力しない
set matchpairs+=（:）,「:」,『:』,【:】,［:］,〈:〉,《:》,‘:’,“:”
set spelllang+=cjk  " 日本語をスペルチェックから除外する

"" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
"" http://qiita.com/ssh0/items/9e7f0d8b8f033183dd0b
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

set formatexpr=jpfmt#formatexpr()

"" Language extensions {{{1

augroup lang_make "{{{2
  autocmd!
  au FileType make setl tabstop=4
augroup END

augroup lang_viml "{{{2
  autocmd!
  au FileType vim setl shiftwidth=2
augroup END

augroup lang_fish "{{{2
  autocmd!
  au FileType fish compiler fish
augroup END

augroup lang_scheme "{{{2
  autocmd!
  au BufNewFile,BufRead *.scm,*.sld,*.ss let b:parinfer_gauche_reader_syntax = 1
augroup END

let g:r7rs_more_parens = '}]'
let g:r7rs_use_gauche = 1
let g:tagbar_type_r7rs = {
      \   'ctagstype': 'scheme',
      \   'kinds': [ 'f:functions' ]
      \ }

augroup lang_markdown "{{{2
  autocmd!
  au BufNewFile,BufFilePre,BufRead *.md setl filetype=markdown.pandoc
  au FileType markdown*
        \ nnoremap <buffer> j gj|
        \ nnoremap <buffer> k gk|
        \ nnoremap <buffer> gj j|
        \ nnoremap <buffer> gk k|
        \ setl wrap
augroup END

augroup lang_rmarkdown "{{{2
  autocmd!
  au FileType rmarkdown
        \ nnoremap <buffer> j gj|
        \ nnoremap <buffer> k gk|
        \ nnoremap <buffer> gj j|
        \ nnoremap <buffer> gk k|
        \ setl wrap
augroup END

let g:pandoc#syntax#conceal#use = 0

augroup lang_mathematica "{{{2
  autocmd!
  au BufNewFile,BufFilePre,BufRead *.m,*.wl setl filetype=wl
  au FileType wl setl shiftwidth=2
augroup END

let g:mma_candy = 0

augroup lang_r "{{{2
  autocmd!
  au TermOpen * setl nonumber
  au FileType r setl shiftwidth=4
augroup END

let g:R_assign = 0
let g:R_pdfviewer = 'zathura'
" let g:R_args = ['-q']
let g:ale_r_lintr_options = "with_defaults(line_length_linter(" . &textwidth . "))"

augroup lang_rust "{{{2
  autocmd!
  au FileType rust
        \ nmap <buffer> <silent> K <Plug>(rust-doc)|
        \ nmap <buffer> <silent> gd <Plug>(rust-def)|
        \ nmap <buffer> <silent> gs <Plug>(rust-def-split)|
        \ nmap <buffer> <silent> gv <Plug>(rust-def-vertical)
augroup END

let g:rust_conceal = 0
let g:rust_fold = 2

"" vim-racer
let g:ftplugin_rust_source_path = $RUST_SRC_PATH

augroup lang_julia "{{{2
  autocmd!
  au FileType julia
        \ nnoremap <buffer> <silent> <LocalLeader>f :call julia#toggle_function_blockassign()<CR>
augroup END

"" Applications inside Vim {{{1

"" Vimwiki {{{2
let g:vimwiki_auto_chdir = 1
let s:vimwiki_root = '~/Dropbox/Documents/vimwiki'
let g:vimwiki_listsyms = ' x'
let s:vimwiki_default =
      \ { 'path': s:vimwiki_root . '/default'
      \ , 'template_path': s:vimwiki_root . '/_templates'
      \ }
let g:vimwiki_list = [ s:vimwiki_default ]

" vim: fdm=marker sw=2 et

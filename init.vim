scriptencoding utf-8

"" Set base directories before loading init scripts
let s:config_home = (exists('$XDG_CONFIG_HOME') ? $XDG_CONFIG_HOME : $HOME . '/.config') . '/nvim'
let s:data_home = (exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . '/.local/share') . '/nvim'
let s:cache_home = (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME . '/.cache') . '/nvim'

if exists('*minpac#init') "{{{1
  call minpac#init({'dir': s:data_home . '/site'})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "" Language extensions
  call minpac#add('aliou/bats.vim')
  call minpac#add('jalvesaq/Nvim-R')
  call minpac#add('maverickg/stan.vim')
  call minpac#add('arnoudbuzing/wolfram-vim')
  call minpac#add('vim-pandoc/vim-rmarkdown')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('racer-rust/vim-racer')
  call minpac#add('baskerville/vim-sxhkdrc')
  call minpac#add('cespare/vim-toml')

  " Sorted by repo name: `:'<,'>sort /\v^[^\/]+\//`
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

"" Language extensions {{{1

augroup lang_make "{{{2
  autocmd!
  au FileType make setl tabstop=4
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



" vim: fdm=marker sw=2 et

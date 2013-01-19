" ==============================================================================
" MacVim settings
" Last Change: 2013-01-20 05:51.
" ==============================================================================

"{{{ PATH

""{{{ pathogen
call pathogen#infect()
""}}}

"}}}
"{{{ LANGUAGE

set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,cp932

""{{{ 日本語を含まない場合は fileencoding に encoding を使うようにする
function! g:vimrc_recheck_fenc()
  if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
    let &fileencoding = &encoding
  endif
endfunction
autocmd BufReadPost * call g:vimrc_recheck_fenc()
""}}}

"}}}
"{{{ UI OPTIONS

filetype on
filetype plugin on
filetype indent on
syntax on

""{{{ Lots of 'set ...'
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set complete+=k
set cursorline
set diffopt=filler,vertical
set expandtab
" set grepprg=internal
set hidden
set history=1000
set hlsearch
set ignorecase
set iminsert=0 imsearch=0
set incsearch
set laststatus=2
set list
set listchars=eol:$,tab:>_,trail:_,extends:>,precedes:<
set mouse=a
set nobackup
set nocompatible
set nocompatible
set nowrap
set number
set ruler
set scroll=5
set scrolloff=4
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=80
set viminfo+=n~/.vim/cache/viminfo
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest
set wrapscan
""}}}
""{{{ Suffixes that get lower priority when doing tab completion for filenames
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg
set suffixes+=.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
""}}}
""{{{ 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
""}}}
""{{{ grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
""}}}
""{{{ * で検索した後カーソル移動しない
nnoremap * *N
nnoremap # #N
""}}}

"}}}
"{{{ LOOK AND FEEL

""{{{ Highlight current cursor line only
augroup vimrc_current_cursor_line
  autocmd! vimrc_current_cursor_line
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
""}}}
""{{{ Color scheme
" colorscheme Tomorrow-Night
set background=light
colorscheme solarized
""}}}
""{{{ Other highlights
"" See http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
au BufRead,BufNewFile,FileType * hi Normal       ctermfg=237
au BufRead,BufNewFile,FileType * hi DiffAdd      ctermfg=237 ctermbg=61
au BufRead,BufNewFile,FileType * hi DiffChange   ctermfg=237 ctermbg=66
au BufRead,BufNewFile,FileType * hi DiffText     ctermfg=237 ctermbg=61
au BufRead,BufNewFile,FileType * hi DiffDelete   ctermfg=202 ctermbg=95
""}}}

"}}}
"{{{ KEY MAPS

""{{{ map leader を ';' に変更（そのため元の ';' を ';;' に避難）
nnoremap ;; ;
let mapleader = ';'
""}}}
""{{{ 移動系のキー
nnoremap j gj
nnoremap k gk
nnoremap <C-j> +
nnoremap <C-k> -
""}}}
""{{{ フレームサイズを怠惰に変更する
map + <C-W>+
map - <C-W>-
map > <C-W>>
map < <C-W><
""}}}
""{{{ 段落整形
nmap Q gqap
""}}}
""{{{ <C-c> の 2 回押しでハイライト消去
nmap <silent> <C-c><C-c> :nohlsearch<CR>
""}}}
""{{{ カンマのあとにスペースを1個補完
inoremap , ,<SPACE>
""}}}

"}}}
"{{{ PLUGINS

""{{{ matchit
so $VIMRUNTIME/macros/matchit.vim
""}}}
""{{{ autodate
let autodate_format = '%Y-%m-%d %H:%M'
let autodate_keyword_pre = '\c\%(#+\?DATE\|LAST \%(MODIFIED\|CHANGE\)\):'
let autodate_keyword_post = '\.'
""}}}
""{{{ camelcasemotion
"" Replace the default 'w', 'b', and 'e' mappings instead of defining
"" additional mappings ',w', ',b', and ',e':
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
"" Replace default 'iw' text-object and define 'ib' and 'ie' motions:
omap <silent> iw <Plug>CamelCaseMotion_iw
vmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
vmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
vmap <silent> ie <Plug>CamelCaseMotion_ie
""}}}
""{{{ YankRing
let g:yankring_window_auto_close = 1
let g:yankring_history_dir = $HOME.'/.vim/cache'
""}}}
""{{{ yanktmp
let g:yanktmp_file = $HOME.'/.vim/cache/vimyanktmp'
nnoremap <silent> sy :call YanktmpYank()<CR>
vnoremap <silent> sy :call YanktmpYank()<CR>
nnoremap <silent> sp :call YanktmpPaste_p()<CR>
vnoremap <silent> sp :call YanktmpPaste_p()<CR>
nnoremap <silent> sP :call YanktmpPaste_P()<CR>
vnoremap <silent> sP :call YanktmpPaste_P()<CR>
""}}}
""{{{ poslist
let g:poslist_histsize = 1000
map <C-o> <Plug>(poslist-prev-pos)
map <C-i> <Plug>(poslist-next-pos)
map <Leader><C-o> <Plug>(poslist-prev-buf)
map <Leader><C-i> <Plug>(poslist-next-buf)
""}}}
""{{{ visualstar
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N
""}}}
""{{{ cmigemo
nnoremap <silent> g/ :set incsearch<CR>g/
nnoremap <silent> g? :set incsearch<CR>g?
""}}}
""{{{ Gundo
nnoremap <Leader>g :GundoToggle<CR>
""}}}
""{{{ Tabular
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
""}}}
""{{{ NERD Commenter
let NERDSpaceDelims = 1
" let NERDRemoveExtraSpaces=1
let NERDCompactSexyComs = 1
""}}}
""{{{ Surround
"let g:surround_33="<!-- \r -->"
"let g:surround_35="#{\r}"
"let g:surround_36="${\r}"
"let g:surround_37="<% \r %>"
"let g:surround_45="<!-- \r -->"
"let g:surround_64="@{\r}"
""}}}
""{{{ Tagbar
nnoremap <Leader>l :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/opt/local/bin/jexctags'
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 1
" let g:tagbar_expand = 1
let g:tagbar_iconchars = ['▾', '▸']
""}}}
""{{{ Powerline
" let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_dir = $HOME.'/.vim/cache'
" let g:Powerline_colorscheme = 'solarized256'
""}}}
""{{{ QFixGrep
let g:MyGrep_MenuBar = 1
""}}}
""{{{ Unite
let g:unite_data_directory = $HOME.'/.vim/cache/unite'
nnoremap <silent> <Leader>e :Unite
      \ -auto-resize buffer file<CR>
nnoremap <silent> <Leader>E :UniteWithCurrentDir
      \ -auto-resize file_mru directory_mru file<CR>
"" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
"" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')
""}}}
""{{{ ref
let g:ref_cache_dir = $HOME.'/.vim/cache/vim_ref_cache'
let g:ref_man_cmd = 'man -P cat'
let g:ref_clojure_cmd = 'cake repl'
""}}}
""{{{ VimFiler
let g:vimfiler_data_directory = $HOME.'/.vim/cache/vimfiler'
let g:vimfiler_as_default_explorer = 1
""}}}
""{{{ neocomplcache
"" Set options
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 100
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_auto_delimiter = 1
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_temporary_dir = $HOME.'/.vim/cache/neocon'

"" Include completions
let g:neocomplcache_ctags_program = '/opt/local/bin/jexctags'
if !exists('g:neocomplcache_include_paths')
  let g:neocomplcache_include_paths = {}
endif
" let g:neocomplcache_include_paths.cpp =
      " \ "/opt/local/include/gcc45/c++,".
      " \ "/opt/local/lib/R/include,/opt/local/lib/R/include/R_ext"

"" Dictionary completions
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists = {}
endif
let g:neocomplcache_dictionary_filetype_lists.scheme =
      \ $HOME.'/.gosh_completions'

"" Omni completions
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" autocmd FileType c setlocal omnifunc=ccomplete#Complete
" autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType sql,mysql  setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType html,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS

"" Partial omni completions
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"" Key maps
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
"" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

"" Utilities
function! g:vimrc_neocomplcache_update_tags() "{{{
  NeoComplCacheCachingInclude
  for file in neocomplcache#sources#include_complete#get_include_files(bufnr('%'))
    execute "setlocal tags+=".neocomplcache#cache#encode_name('include_tags', file)
  endfor
endfunction
command NeoComplCacheUpdateTags call g:vimrc_neocomplcache_update_tags() "}}}
""}}}
""{{{ neosnippet
"" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

"" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

"" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
""}}}
""{{{ clang_complete
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
let g:clang_library_path = '/opt/local/libexec/llvm-3.2/lib'
let g:clang_user_options = '|| exit 0'
""}}}
""{{{ R plugin
let vimrplugin_term = ""
let vimrplugin_term_cmd = ""
" let vimplugin_tmux=1
" let vimrplugin_r_path='/opt/local/bin/R'
" let vimrplugin_screenplugin=0
""}}}
""{{{ Gauche (necoie)
let is_gauche = 1
au FileType scheme inoremap <buffer> ' '
au FileType scheme inoremap <buffer> , ,
"au FileType scheme inoremap <buffer> ` `()<LEFT>
""}}}
""{{{ Slimv
let g:slimv_disable_scheme = 1
let g:slimv_swank_cmd =
      \ '!osascript -e "tell app \"Terminal\" to do'.
      \ ' script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
let g:slimv_swank_clojure =
      \ '!osascript -e "tell app \"Terminal\" to do'.
      \ ' script \"lein swank\""'
let g:slimv_ctags = 'jexctags -a --language-force=lisp *.lisp *.clj'
let g:slimv_leader = ','
let g:slimv_repl_split = 2
let g:slimv_repl_syntax = 1
let g:slimv_repl_wrap = 1
let g:slimv_clhs_root = 'http://localhost/~mnacamura/refs/lisp/HyperSpec/Body/'
let g:slimv_cljapi_root = 'http://localhost/~mnacamura/refs/clojure/clojure/clojure/'
let g:slimv_javadoc_root = 'http://localhost/~mnacamura/refs/java/jdk6/api/'
au FileType clojure inoremap <buffer> ' '
au FileType lisp inoremap <buffer> ' '
" au FileType lisp inoremap <buffer> ` `()<LEFT>
""}}}
""{{{ Ocaml
" let g:omlet_indent = 1
au FileType ocaml inoremap <buffer> ' '
"}}}

""}}}
"{{{ FINALLY

""{{{ 前回終了したカーソル行に移動
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" | endif
""}}}

"}}}

" vim: foldmethod=marker

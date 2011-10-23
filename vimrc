""" Configurations for MacVim with KaoriYa
""" Last change: 2011-10-24 07:38:11.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" pathogen.vim

call pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Language environment

set fileformat=unix
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,cp932

"" 日本語を含まない場合は fileencoding に encoding を使うようにする
function! AU_ReCheck_FENC()
  if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
    let &fileencoding=&encoding
  endif
endfunction
autocmd BufReadPost * call AU_ReCheck_FENC()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Miscellaneous

syntax on
filetype on
filetype indent on
filetype plugin on
set nocompatible
set nobackup
set number
set history=1000
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=2
set scrolloff=4
set expandtab
set softtabstop=4
set smarttab
set smartindent
set ignorecase
set smartcase
set visualbell
set textwidth=80
set wildmenu
set wildmode=list:longest
set hlsearch
set incsearch
set cursorline
"" highlight current cursor line only
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
set wrapscan
set showmatch
set showcmd
" set diffopt=vertical
set mouse=a
" set modelines=0
set ruler
set nowrap
set virtualedit=all
set list
set listchars=eol:$,tab:>_,trail:_,extends:>,precedes:<
set grepprg=internal
set hidden
set autoread
set laststatus=2
" set foldmethod=syntax
set iminsert=0 imsearch=0
set complete+=k

"" Color scheme for use in terminal
" let moria_style='dark'
" colorscheme moria
colorscheme Sunburst
"" For color names, see
"" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
au BufRead,BufNewFile,FileType * hi Normal                   ctermbg=0
au BufRead,BufNewFile,FileType * hi Visual       ctermfg=236 ctermbg=186
au BufRead,BufNewFile,FileType * hi StatusLine   ctermfg=236 ctermbg=255
au BufRead,BufNewFile,FileType * hi StatusLineNC ctermfg=236 ctermbg=247
au BufRead,BufNewFile,FileType * hi CursorLine               ctermbg=236
au BufRead,BufNewFile,FileType * hi DiffAdd      ctermfg=236 ctermbg=61
au BufRead,BufNewFile,FileType * hi DiffChange   ctermfg=236 ctermbg=65
au BufRead,BufNewFile,FileType * hi DiffText     ctermfg=236 ctermbg=66
au BufRead,BufNewFile,FileType * hi DiffDelete   ctermfg=202 ctermbg=95
au BufRead,BufNewFile,FileType * hi IncSearch    ctermfg=88  ctermbg=218
au BufRead,BufNewFile,FileType * hi Search       ctermfg=88  ctermbg=218

"" Status line
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"" Suffixes that get lower priority when doing tab completion for filenames.
"" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key maps

"" map leader を ';' に変更（そのため元の ';' を ';;' に避難）
nnoremap ;; ;
let mapleader=';'

"" 移動系のキー
nnoremap j gj
nnoremap k gk
nnoremap <C-j> +
nnoremap <C-k> -

"" 段落整形
nmap Q gqap

"" <C-c> の 2 回押しでハイライト消去
nmap <silent> <C-c><C-c> :nohlsearch<CR>

"" フレームサイズを怠惰に変更する
map + <C-W>+
map - <C-W>-
map > <C-W>>
map < <C-W><

"" Misc.
inoremap , ,<SPACE>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins

"" matchit.vim
so $VIMRUNTIME/macros/matchit.vim

""" camelcasemotion
"" Replace the default 'w',  'b' and 'e' mappings instead of defining
"" additional mappings ',w', ',b' and ',e':
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

""" YankRing.vim
let g:yankring_window_auto_close=1
let g:yankring_history_dir='/tmp/'

""" yanktmp.vim
nnoremap <silent> sy :call YanktmpYank()<CR>
vnoremap <silent> sy :call YanktmpYank()<CR>
nnoremap <silent> sp :call YanktmpPaste_p()<CR>
vnoremap <silent> sp :call YanktmpPaste_p()<CR>
nnoremap <silent> sP :call YanktmpPaste_P()<CR>
vnoremap <silent> sP :call YanktmpPaste_P()<CR>

""" Tabular.vim
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>

""" NERD Commenter
let NERDSpaceDelims=1
" let NERDRemoveExtraSpaces=1

""" surround.vim
"let g:surround_33="<!-- \r -->"
"let g:surround_35="#{\r}"
"let g:surround_36="${\r}"
"let g:surround_37="<% \r %>"
"let g:surround_45="<!-- \r -->"
"let g:surround_64="@{\r}"
"
""" unite.vim
nnoremap <silent> <Leader>e :Unite
      \ -auto-resize buffer<CR>
nnoremap <silent> <Leader>E :UniteWithCurrentDir
      \ -auto-resize file file_mru directory_mru<CR>
"" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
"" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')

""" occur.vim
nnoremap <silent> <Leader>oo :Occur<CR>
nnoremap <silent> <Leader>om :Moccur<CR>

""" cmigemo
nnoremap <silent> g/ :set incsearch<CR>g/
nnoremap <silent> g? :set incsearch<CR>g?

""" autodate.vim
let autodate_format='%Y-%m-%d %H:%M:%S'
let autodate_keyword_pre='Last change:'
let autodate_keyword_post='\.'

""" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_max_list=20
let g:neocomplcache_enable_ignore_case=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_enable_auto_delimiter=1
"" Include completions
let g:neocomplcache_ctags_program='/opt/local/bin/jexctags'
if !exists('g:neocomplcache_include_paths')
  let g:neocomplcache_include_paths={}
endif
let g:neocomplcache_include_paths.cpp="/opt/local/include/gcc45/c++,/opt/local/lib/R/include,/opt/local/lib/R/include/R_ext"
"" Dictionary completions
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists={}
endif
let g:neocomplcache_dictionary_filetype_lists.scheme=$HOME.'/.gosh_completions'
"" Omni completions
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns={}
endif
let g:neocomplcache_omni_patterns.c='\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp='\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
autocmd FileType c setlocal omnifunc=ccomplete#Complete
" autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType sql,mysql  setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType html,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
"" Key maps
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"" TAB completion
function InsertTabWrapper()
  if neocomplcache#sources#snippets_complete#expandable()
    return "\<Plug>(neocomplcache_snippets_expand)"
  elseif pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
imap <expr><tab> InsertTabWrapper()
"" Utilities
function NeoComplCacheUpdateTags()
  NeoComplCacheCachingInclude
  for file in neocomplcache#sources#include_complete#get_include_files(bufnr('%'))
    execute "setlocal tags+=".neocomplcache#cache#encode_name('include_tags', file)
  endfor
endfunction
command NeoComplCacheUpdateTags call NeoComplCacheUpdateTags()

""" OmniCppComplete
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " show function parameters
let OmniCpp_MayCompleteDot=1 " autocomplete after .
let OmniCpp_MayCompleteArrow=1 " autocomplete after ->
let OmniCpp_MayCompleteScope=1 " autocomplete after ::
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
au FileType cpp setlocal tags+=~/.vim/tags/cpp

""" Vim-R-plugin2
let vimrplugin_term=""
let vimrplugin_term_cmd = ""

""" Gauche (necoie)
let is_gauche=1
au FileType scheme inoremap <buffer> ' '
au FileType scheme inoremap <buffer> , ,
"au FileType scheme inoremap <buffer> ` `()<LEFT>

""" Slimv on Clojure
let g:slimv_cljapi_root='http://localhost/~mnacamura/refs/clojure/clojure/'
let g:slimv_javadoc_root='http://localhost/~mnacamura/refs/java/docs/ja/api/'
let g:slimv_ctags='/opt/local/bin/jexctags -a --language-force=lisp *.lisp *.clj'
let g:slimv_leader=','
let g:slimv_lisp='cake repl'
let g:slimv_repl_split=2
let g:slimv_repl_syntax=1
let g:slimv_repl_wrap=1
au FileType clojure inoremap <buffer> ' '
" au FileType clojure inoremap <buffer> ` `()<LEFT>

""" easytags.vim
let g:easytags_cmd = '/opt/local/bin/jexctags'
" let g:easytags_on_cursorhold = 0
set tags=./.tags;,~/.vimtags

""" taglist.vim
nnoremap <Leader>l :TlistToggle<CR>
" set tags=tags
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='/opt/local/bin/jexctags'
" let Tlist_GHC_Cmd='/usr/local/bin/ghc'
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
let Tlist_WinWidth=28

""" VimFiler
let g:vimfiler_as_default_explorer=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" At last

"" 前回終了したカーソル行に移動
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" | endif


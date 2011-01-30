""" Configurations for MacVim with KaoriYa
""" Last change: 2011/01/29 18:28:18.

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
"set textwidth=76
set wildmenu
set wildmode=list:longest
set hlsearch
set incsearch
set wrapscan
set showmatch
set showcmd
"set diffopt=vertical
set mouse=a
"set modelines=0
set ruler
set nowrap
set virtualedit=all
set list
set listchars=eol:$,tab:>_,trail:_,extends:>,precedes:<
set grepprg=internal
set hidden
set autoread
set laststatus=2
"set foldmethod=syntax
set iminsert=0 imsearch=0

"" Status line
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"" Suffixes that get lower priority when doing tab completion for filenames.
"" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key maps

let mapleader=';'
nnoremap j gj
nnoremap k gk
nnoremap <C-j> 3+
nnoremap <C-k> 3-
nnoremap t :tabnew
"nnoremap <C-n> :tabNext<CR>
"nnoremap <C-p> :tabprevious<CR>
nmap Q gqap
inoremap , ,<SPACE>
"inoremap ; ;<SPACE>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins

"" matchit.vim
so $VIMRUNTIME/macros/matchit.vim

"" camelcasemotion
" Replace the default 'w',  'b' and 'e' mappings instead of defining
" additional mappings ',w', ',b' and ',e':
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
" Replace default 'iw' text-object and define 'ib' and 'ie' motions:
omap <silent> iw <Plug>CamelCaseMotion_iw
vmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
vmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
vmap <silent> ie <Plug>CamelCaseMotion_ie

"" YankRing.vim
let g:yankring_window_auto_close=1
let g:yankring_history_dir='$HOME/.vim/tmp/'

"" yanktmp.vim
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"" screenpaste
map  <Leader>sp  <Plug>ScreenpastePut
map! <Leader>sp  <Plug>ScreenpastePut
map  <Leader>sgp <Plug>ScreenpasteGPut
nmap <Leader>sP  <Plug>ScreenpastePutBefore
nmap <Leader>sgP <Plug>ScreenpasteGPutBefore

"" Tabular.vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"" NERD Commenter
let NERDShutUp=1

"" surround.vim
let g:surround_33 = "<!-- \r -->"
let g:surround_35 = "#{\r}"
let g:surround_36 = "${\r}"
let g:surround_37 = "<% \r %>"
let g:surround_45 = "<!-- \r -->"
let g:surround_64 = "@{\r}"

"" unite.vim
map <silent> <C-E> :Unite buffer file_mru file<CR>

"" occur.vim
nnoremap <silent> <Leader>oo :Occur<CR>
nnoremap <silent> <Leader>om :Moccur<CR>

""" cmigemo
nnoremap <silent> g/ :set incsearch<CR>g/
nnoremap <silent> g? :set incsearch<CR>g?

"" autodate.vim
let autodate_format='%Y/%m/%d %H:%M:%S'
let autodate_keyword_pre='Last change:'
let autodate_keyword_post='\.'

"" vimspell
let spell_executable="aspell"
let vimspell_default_language="english"
let spell_auto_type="" " \"tex,mail,text,html,sgml,otl,cvs\"
hi SpellErrors ctermfg=Red cterm=underline term=reverse

"" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_max_list=10
let g:neocomplcache_enable_ignore_case=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_quick_match=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_enable_auto_delimiter=1
"let g:neocomplcache_snippets_dir=
let g:neocomplcache_ctags_program="/opt/local/bin/jexctags"
let g:neocomplcache_dictionary_filetype_lists={
      \ 'default' : '',
      \ 'scheme'  : $HOME.'/.gosh_completions',
      \ 'lisp'    : $HOME.'/.sbcl_completions',
      \ }
" Key maps
"inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <expr><C-e> neocomplcache#cancel_popup()
" TAB completion
function InsertTabWrapper()
  if pumvisible()
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
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"" easytags.vim
let g:easytags_cmd = '/opt/local/bin/jexctags'
set tags=./.tags;,~/.vimtags

""" taglist.vim
nnoremap <Leader>l :TlistToggle<CR>
"set tags=tags
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='/opt/local/bin/jexctags'
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
let Tlist_WinWidth=28

"" Vim-R-plugin
let vimrplugin_term=""
let vimrplugin_term_cmd = ""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Languages

"" Enable omni completion
autocmd FileType c          setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType sql,mysql  setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType html,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS

"" Scheme (Gauche)
au FileType scheme inoremap <buffer> ' '
au FileType scheme inoremap <buffer> , ,
"au FileType scheme inoremap <buffer> ` `()<LEFT>
let is_gauche=1

"" Lisp
au FileType lisp inoremap <buffer> ' '
au FileType lisp inoremap <buffer> , ,
"au FileType lisp inoremap <buffer> ` `()<LEFT>

"" OCaml
au FileType lisp inoremap <buffer> ' '

"" Haskell
au FileType haskell inoremap <buffer> ' '
" syntax/haskell.vim
let hs_highlight_delimiters=1
let hs_highlight_boolean=1
let hs_highlight_types=1
let hs_highlight_more_types=1
let hs_highlight_debug=1
let hs_allow_hash_operator=1
let lhs_markup='tex'
" indent/haskell.vim
"let g:haskell_indent_if = 3
"let g:haskell_indent_case = 5
" Haskell mode for vim
au FileType haskell compiler ghc
let g:haddock_browser='open'
let g:haddock_browser_callformat='%s %s'
let g:haddock_docdir=$HOME.'/Sites/refs/haskell/ghc/'
let g:haddock_indexfiledir=$HOME.'/.vim/tmp/'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" At last

"" 前回終了したカーソル行に移動
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" | endif


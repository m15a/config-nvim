" ==============================================================================
" MacVim settings
" Last Change: 2016-02-03 16:19.
" ==============================================================================

"{{{ Encodings

set fileformat=unix
set fileformats=unix,dos,mac

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932

"" 日本語を含まない場合は fileencoding に encoding を使う
autocmd BufReadPost *
  \ if &fileencoding =~# 'iso-2022-jp' && search ("[^\x01-\x7e]", 'n') == 0 |
  \   let &fileencoding = &encoding | endif

"}}}
"{{{ NeoBundle

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin (expand ('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"" After install, cd /path/to/vimproc; and make -f make make_mac.mak
NeoBundle 'Shougo/vimproc'

"" Look and feel
NeoBundle 'bling/vim-airline'
NeoBundle 'altercation/vim-colors-solarized'

"" Interface
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'ghewgill/vim-scmdiff'
NeoBundle 'godlygeek/tabular'
NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'vim-scripts/autodate.vim'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'fuenor/JpFormat.vim'

"" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'osyo-manga/unite-quickfix'

"" Ref
NeoBundle 'thinca/vim-ref'

"" Neocomplete
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

"" Perl
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'y-uuki/unite-perl-module.vim'
NeoBundle 'c9s/perlomni.vim'

"" Haskell
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'

"" OCaml
NeoBundle 'the-lambda-church/merlin'

"" Mathematica
NeoBundle 'rsmenon/vim-mathematica'

"" R
NeoBundle 'jimmyharris/vim-r-plugin2'

"" Gauche
NeoBundle 'aharisu/vim-gdev'

"" Fish
NeoBundle 'dag/vim-fish'

"" Markdown
NeoBundle 'vim-scripts/vim-pandoc'

""LaTeX
NeoBundle 'lervag/vimtex'

"" STAN
NeoBundle 'maverickg/stan.vim'

call neobundle#end ()
filetype plugin indent on

NeoBundleCheck

"}}}
"{{{ Key Maps

"" ';' as a map leader and  let ';;' map ';'
nnoremap ;; ;
let mapleader = ';'

"" Cursor moves
nnoremap j gj
nnoremap k gk
nnoremap <C-j> +
nnoremap <C-k> -

"" Maps to change frame sizes
map + <C-W>+
map - <C-W>-
map > <C-W>>
map < <C-W><

"" <C-c><C-c> clears highlights
nmap <silent> <C-c><C-c> :nohlsearch<CR>

"" Complete a space after a comma
" inoremap , ,<SPACE>

"" Insert time stamps (see Vim Technic Bible 4-1)
cnoremap <expr> <C-x>dt strftime('%Y%m%d')
cnoremap <expr> <C-x>ts strftime('%Y%m%d%H%M')

"" Substitute a word with a yanked word (see Vim Technic Bible 4-6)
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

"}}}
"{{{ Look and Feel

"" Highlight current cursor line only
augroup vimrc_current_cursor_line
  autocmd! vimrc_current_cursor_line
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

"" Colorize columns over 80: http://hanschen.org/2012/10/24/
exec "set colorcolumn=" . join (range (81, 335), ',')

"}}}
"{{{ Interface

set autoread
set backspace=indent,eol,start
set backupcopy=no
set clipboard=unnamed
set complete+=k
set cursorline
set diffopt=filler,vertical
set expandtab
set hidden
set history=1000
set hlsearch
set iminsert=0 imsearch=0
set ignorecase
set incsearch
set infercase
set laststatus=2
set list
set listchars=eol:$,tab:>_,trail:_,extends:>,precedes:<
set mouse=a
set nobackup
set nowritebackup
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

"" matchit
source $VIMRUNTIME/macros/matchit.vim

"" Hack for vim + fish problem:
"" http://badsimplicity.com/vim-fish-e484-cant-open-file-tmpvrdnvqe0-error/
if &shell =~# 'fish$'
  set shell=/bin/sh
endif

"" 前回終了したカーソル行に移動
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" | endif

"" Suffixes that get lower priority when doing tab completion for filenames
set suffixes=.bak,~,.swp,.o,.info
set suffixes+=.brf,.cb,.ind,.idx,.ilg,.inx
set suffixes+=.aux,.bbl,.blg,.dvi,.end,.fls,.log,.out,.spl,.tdo,.toc  " TeX

"" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

"" Grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"" * で検索した後カーソル移動しない
nnoremap * *N
nnoremap # #N

"" ペースト部分を選択する
" nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"" Toggle spell check mode
" nnoremap <Leade;>f :set invspell<CR>

"}}}
"{{{ Plugin settings

"" Look and feel
"{{{ NeoBundle 'bling/vim-airline'
let g:airline_left_sep          = ''
let g:airline_right_sep         = ''
let g:airline_detect_iminsert   = 1
let g:airline_inactive_collapse = 1
" let g:airline_powerline_fonts   = 0
"}}}
"{{{ NeoBundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized
"}}}

"" Interface
"{{{ NeoBundle 'Townk/vim-autoclose'
"}}}
"{{{ NeoBundle 'bkad/CamelCaseMotion'
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
"}}}
"{{{ NeoBundle 'ghewgill/vim-scmdiff'
""}}}
"{{{ NeoBundle 'godlygeek/tabular'
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
nnoremap <Leader>a> :Tabularize /=><CR>
vnoremap <Leader>a> :Tabularize /=><CR>
"}}}
"{{{ NeoBundle 'houtsnip/vim-emacscommandline'
"}}}
"{{{ NeoBundle 'majutsushi/tagbar'
nnoremap <Leader>l :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/opt/local/bin/jexctags'
let g:tagbar_width = 35
" let g:tagbar_autoclose = 1
" let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 1
let g:tagbar_expand = 1
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['▾', '▸']
let g:tagbar_autoshowtag = 1
"}}}
"{{{ NeoBundle 'rhysd/clever-f.vim'
let g:clever_f_smart_case = 1
let clever_f_use_migemo = 1
"}}}
"{{{ NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims       = 1
" let NERDRemoveExtraSpaces = 1
let NERDCompactSexyComs   = 1
"}}}
"{{{ NeoBundle 'sjl/gundo.vim'
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_close_on_revert = 1
"}}}
"{{{ NeoBundle 'thinca/vim-quickrun'
au QuickFixCmdPost * cfile
let g:quickrun_config = {}
let g:quickrun_config._ = {
      \ 'runner'                    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 40,
      \ 'outputter'                 : 'quickfix',
      \ 'outputter/buffer/split'    : '6sp',
      \ 'outputter/quickfix/open_cmd' : 'cfile',
      \ }
"}}}
"{{{ NeoBundle 'tpope/vim-surround'
"}}}
"{{{ NeoBundle 'vim-scripts/YankRing.vim'
let g:yankring_window_auto_close = 1
let g:yankring_history_dir = $HOME.'/.vim/cache'
"}}}
"{{{ NeoBundle 'vim-scripts/autodate.vim'
let autodate_format       = '%Y-%m-%d %H:%M'
let autodate_keyword_pre  = '\c\%(#+\?DATE\|LAST \%(MODIFIED\|CHANGE\)\):'
let autodate_keyword_post = '\.'
"}}}
"{{{ NeoBundle 'vim-scripts/yanktmp.vim'
let g:yanktmp_file = $HOME.'/.vim/cache/yanktmp'
nnoremap <silent> sy :call YanktmpYank()<CR>
vnoremap <silent> sy :call YanktmpYank()<CR>
nnoremap <silent> sp :call YanktmpPaste_p()<CR>
vnoremap <silent> sp :call YanktmpPaste_p()<CR>
nnoremap <silent> sP :call YanktmpPaste_P()<CR>
vnoremap <silent> sP :call YanktmpPaste_P()<CR>
"}}}
"{{{ NeoBundle 'scrooloose/syntastic'
" let g:syntastic_auto_loc_list = 1
map <silent> <Leader>E :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
if ! exists ('g:syntastic_mode_map')
  let g:syntastic_mode_map = { "mode"             : "passive",
                             \ "active_filetypes" : [],
                             \ "passive_filetypes": []
                             \ }
endif
"}}}
"{{{ NeoBundle 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_guide_size = 1
au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
" let g:indent_guides_default_mapping = 0
" nnoremap <silent> <Leader>ig <Plug>IndentGuidesToggle
"}}}
"{{{ NeoBundle 'fuenor/JpFormat.vim'
set formatexpr=jpfmt#formatexpr()
set formatoptions+=mM  " 日本語の行の連結時には空白を入力しない

" 現在行を整形
nnoremap <silent> gl gqq
vnoremap <silent> gl gqq

" 現在の段落を整形
nnoremap <silent> gp gqap
vnoremap <silent> gp gqap
"}}}

"" Unite
"{{{ NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
" Key maps
let g:unite_data_directory = $HOME.'/.vim/cache/unite'
nnoremap <Leader>e :<C-u>Unite -auto-resize buffer file<CR>
nnoremap <Leader>f :<C-u>Unite -auto-resize line<CR>
nnoremap <Leader>g :<C-u>Unite -auto-resize grep:.<CR>
nnoremap <Leader>G :<C-u>Unite -auto-resize grep:.<CR><C-R><C-W>
nnoremap <leader>y :<C-u>Unite -auto-resize history/yank<CR>
nnoremap <leader>R :<C-u>UniteResume -auto-resize<CR>

" Unite grep に ag (The Silver Searcher) を使う
if executable ('ag')
  let g:unite_source_grep_command       = 'ag'
  let g:unite_source_grep_default_opts  = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>s unite#do_action('split')
"" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <c-w>v unite#do_action('vsplit')
"}}}
"{{{ NeoBundle 'osyo-manga/unite-quickfix'
nnoremap <Leader>q :<C-u>Unite -auto-resize quickfix<CR>
"}}}

"" Ref
"{{{ NeoBundle 'thinca/vim-ref'
let g:ref_cache_dir = $HOME.'/.vim/cache/ref'
let g:ref_use_vimproc = 1
" let g:ref_open =
"}}}

"" Neocomplete
"{{{ NeoBundle 'Shougo/context_filetype.vim'
"}}}
"{{{ NeoBundle 'Shougo/neocomplete.vim'
"" Options
let g:neocomplete#enable_at_startup     = 1
let g:neocomplete#enable_auto_select    = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_smart_case     = 1
let g:neocomplete#data_directory        = $HOME.'/.vim/cache/neocon'
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
"}}}
"{{{ NeoBundle 'Shougo/neosnippet.vim'
" let g:neosnippet#snippets_directory            = $HOME./.vim/snippets
" let g:neosnippet#enable_snipmate_compatibility = 1

"" Key maps
imap <C-k>   <Plug>(neosnippet_expand_or_jump)
smap <C-k>   <Plug>(neosnippet_expand_or_jump)
xmap <C-k>   <Plug>(neosnippet_expand_target)
xmap <C-l>   <Plug>(neosnippet_start_unite_snippet_target)

"" SuperTab like snippets behavior
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

"" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"}}}
"{{{ NeoBundle 'Shougo/neosnippet-snippets'
"}}}

"" Perl
au BufRead,BufNewFile cpanfile set filetype=perl
let g:neocomplete#ctags_arguments.perl = '-R -h ".pm"'
au FileType perl nnoremap <Leader>k :<C-u>Unite -auto-resize ref/perldoc<CR>
au FileType perl nnoremap <Leader>m :<C-u>Unite -auto-resize perl/global<CR>
au FileType perl nnoremap <Leader>t <Esc>:%! perltidy -se<CR>
au FileType perl vnoremap <Leader>t <Esc>:'<,'>! perltidy -se<CR>
"{{{ NeoBundle 'vim-perl/vim-perl'
let perl_include_pod = 1
let perl_fold = 1
"}}}
"{{{ NeoBundle 'y-uuki/unite-perl-module.vim'
"}}}
"{{{ NeoBundle 'c9s/perlomni.vim'
let g:neocomplete#sources#omni#input_patterns.perl =
      \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"}}}

"" Haskell
let NERD_haskell_alt_style = 1
"{{{ NeoBundle 'dag/vim2hs'
au FileType haskell compiler hlint
" let g:hlint_args =
let g:haskell_conceal = 0
let g:haskell_conceal_wide = 1
"}}}
"{{{ NeoBundle 'eagletmt/neco-ghc'
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" let g:necoghc_enable_detailed_browse = 1
"}}}
"{{{ NeoBundle 'eagletmt/ghcmod-vim'
au FileType haskell nnoremap <Leader>t :<C-u>GhcModInfo<CR>
au FileType haskell nnoremap <Leader>T :<C-u>GhcModInfoPreview<CR>
"}}}
"{{{ NeoBundle 'eagletmt/unite-haddock'
"}}}

"" OCaml
" ocp-indent "{{{
let g:ocp_indent_vimfile = system ("opam config var share")
let g:ocp_indent_vimfile = substitute (g:ocp_indent_vimfile, '[\r\n]*$', '', '')
let g:ocp_indent_vimfile = g:ocp_indent_vimfile . "/vim/syntax/ocp-indent.vim"
au FileType ocaml exec ":source " . g:ocp_indent_vimfile
"}}}
"{{{ NeoBundle 'the-lambda-church/merlin'
set rtp+=~/.vim/bundle/merlin/vim/merlin
set rtp+=~/.vim/bundle/merlin/vim/vimbufsync
let g:neocomplete#force_omni_input_patterns.ocaml = '[^. *\t]\.\w*'
"}}}

"" Mathematica
au BufRead,BufNewFile *.m set filetype=mma
"{{{ NeoBundle 'rsmenon/vim-mathematica'
let g:mma_highlight_option = "solarized"
let g:mma_candy = 2
"}}}

"" R
"{{{ NeoBundle 'jimmyharris/vim-r-plugin2'
let g:vimrplugin_term     = ""
let g:vimrplugin_term_cmd = "tmux -c R -e"
"}}}

"" Gauche
"{{{ NeoBundle 'aharisu/vim-gdev'
"}}}

"" Nix
au BufRead,BufNewFile *.nix set filetype=nix

"" Fish
" let g:neocomplete#force_omni_input_patterns.fish = '\h\w*'
"{{{ NeoBundle 'dag/vim-fish'
au BufRead,BufNewFile *.fish set filetype=fish
au FileType fish compiler fish
au FileType fish setlocal foldmethod=expr
"}}}

"" Markdown
"{{{ NeoBundle 'vim-scripts/vim-pandoc'
au BufRead,BufNewFile *.md set filetype=pandoc
au FileType pandoc nnoremap <Leader>r :!qlmanage -p % >&/dev/null<CR>
let g:pandoc_no_empty_implicits = 1
let g:pandoc_no_spans           = 1

"}}}

"" LaTeX
set conceallevel=0
let g:tex_flavor = 'latex'

"" STAN
"{{{ NeoBundle 'maverickg/stan.vim'
"}}}

"}}}

" vim: foldmethod=marker

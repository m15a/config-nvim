""" Configurations for MacVim with KaoriYa
""" Last change: 2011/01/17 14:10:01.

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
set history=50
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set scrolloff=4
set expandtab
set softtabstop=2
set smarttab
set smartindent
set ignorecase
set smartcase
set visualbell
"set textwidth=0
"set wildmenu
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
set grepprg=internal
set wildmode=list:longest
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key maps

let mapleader=';'
nnoremap j gj
nnoremap k gk
nnoremap <C-j> 3+
nnoremap <C-k> 3-
nnoremap t :tabnew 
nnoremap <C-n> :tabNext<CR>
nnoremap <C-p> :tabprevious<CR>
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

"" unite.vim
map <silent> <C-E> :Unite buffer<CR>

"" autodate.vim
let autodate_format='%Y/%m/%d %H:%M:%S'
let autodate_keyword_pre='Last change:'
let autodate_keyword_post='\.'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" At last

"" 前回終了したカーソル行に移動
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" | endif


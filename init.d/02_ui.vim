syntax on
filetype plugin indent on

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
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest
set wrapscan

"" Change the cursor shape in the terminal
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"" matchit
if !exists ('g:loaded_matchit')
  runtime macros/matchit.vim
endif

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
" autocmd BufWritePre * :%s/\s\+$//ge

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

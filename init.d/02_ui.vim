set clipboard+=unnamed
set complete+=k
set diffopt+=vertical
set expandtab
set hidden
set ignorecase
set infercase
set list
set listchars=eol:$,tab:>_,trail:_,extends:>,precedes:<
set nowrap
set number
set ruler
set scroll=5
set scrolloff=4
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set virtualedit=all
set visualbell
set wildmode=list:longest

"" Change the cursor shape in the terminal
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

"" * で検索した後カーソル移動しない
nnoremap * *N
nnoremap # #N

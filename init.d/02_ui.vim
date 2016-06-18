"" Ignoring case in patterns
set ignorecase
set smartcase
set infercase

"" Tab expansion and indentation
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=4
set tabstop=4

"" Command-line completion
set wildmode=list:longest

"" Suffixes that get lower priority when doing tab completion for filenames
set suffixes+=.aux,.bbl,.blg,.dvi,.end,.fls,.log,.out,.spl,.tdo,.toc  " LaTeX

"" Clipboard integration
set clipboard+=unnamed

"" hide a buffer instead of unloading it when it is abandoned
set hidden

"" Enable dictionary completion by <CTRL-N> or <CTRL-P>
set complete+=k

"" Miscellaneous look and feel
set diffopt+=vertical
set nowrap
set number
set ruler
set scroll=5
set scrolloff=4
set showmatch
set virtualedit=all
set visualbell

"" Display style of tabs, spaces, and trailing blanks
set list
set listchars=eol:¬,tab:>_,trail:_,extends:»,precedes:«,nbsp:_

"" Change the cursor shape in the terminal
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"" Hack for vim + fish problem:
"" http://badsimplicity.com/vim-fish-e484-cant-open-file-tmpvrdnvqe0-error/
if &shell =~# 'fish$'
  set shell=/bin/sh
endif

"" * で検索した後カーソル移動しない
nnoremap * *N
nnoremap # #N

"" 前回終了したカーソル行に移動
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" | endif

"" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge

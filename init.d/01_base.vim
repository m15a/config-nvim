"" Encodings
set fileformat=unix
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932

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
set cursorline
set diffopt+=vertical
set nowrap
set number
set ruler
set scroll=5
set scrolloff=4
set showmatch
set spelllang=en,cjk  " 日本語をスペルチェックから除外する
set virtualedit=all
set visualbell

"" Persistent undo
set undofile

"" Display style of tabs, spaces, and trailing blanks
set list
set listchars=eol:¬,tab:>_,trail:_,extends:»,precedes:«,nbsp:_

"" Hack for vim + fish problem:
"" http://badsimplicity.com/vim-fish-e484-cant-open-file-tmpvrdnvqe0-error/
if &shell =~# 'fish$'
  set shell=/bin/sh
endif

"" 前回終了したカーソル行に移動
augroup nvimrc_recoverlastcursor
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exec "normal g`\"" |
        \ endif
augroup END

"" 保存時に行末の空白を除去する
" augroup nvimrc
  " au BufWritePre * :%s/\s\+$//ge
" augroup END
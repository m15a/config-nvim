scriptencoding utf-8

"" Use <NL> for <EOL>
set fileformat=unix
set fileformats=unix,dos,mac

"" Ignoring case in patterns
set ignorecase
set smartcase
set infercase

"" Tab expansion and indentation
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4

"" Command-line completion
set wildmode=list:longest
set suffixes+=.omc  " OMake

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
set textwidth=80
set virtualedit=all
set visualbell

"" Persistent undo
set undofile

"" Display style of tabs, spaces, trailing blanks, and soft wraps
set list
set listchars=eol:¬,tab:>_,trail:_,extends:»,precedes:«,nbsp:_
set showbreak=»

"" Hack for vim + fish problem:
"" http://badsimplicity.com/vim-fish-e484-cant-open-file-tmpvrdnvqe0-error/
if &shell =~# 'fish$'
  set shell=/bin/sh
endif

"" Move cursor to its last position
augroup nvimrc_lastcursorposition
  autocmd!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$")|
        \   exec "normal g`\""|
        \ endif
augroup END

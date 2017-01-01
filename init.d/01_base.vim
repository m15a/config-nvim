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
set wildignorecase
set wildmode=list:longest
set suffixes+=.omc  " OMake

"" Clipboard integration
set clipboard+=unnamed

"" hide a buffer instead of unloading it when it is abandoned
set hidden

"" Enable dictionary completion by <CTRL-N> or <CTRL-P>
set complete+=k

"" Let <CTRL-A> and <CTRL-X> interpret only decimal numbers
set nrformats=

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

"" Use ripgrep if available
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"" '%%' expands to '%:h'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

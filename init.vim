"" Set base directories before loading init scripts
let s:config_home = (exists('$XDG_CONFIG_HOME') ? $XDG_CONFIG_HOME : $HOME . "/.config") . "/nvim"
let s:data_home = (exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . "/.local/share") . "/nvim"
let s:cache_home = (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME . "/.cache") . "/nvim"

call plug#begin(s:data_home . '/plugged') "{{{1

"" Basic settings
Plug 'tpope/vim-sensible'

"" Color scheme and status line
Plug 'itchyny/lightline.vim'
Plug 'jonathanfilip/vim-lucius'

"" Text objects
Plug 'chaoren/vim-wordmotion'  " replaces CamelCaseMotion
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'  " conflicts with vimtex's mapping `ie`
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'  " required by the other textobj plugins
Plug 'wellle/targets.vim'

"" UI enhancements
Plug 'houtsnip/vim-emacscommandline'
" Plug 'jiangmiao/auto-pairs'  " vim-surround provides it by <C-S>
Plug 'rhysd/clever-f.vim'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"" Language plugins
Plug 'LnL7/vim-nix'
Plug 'dag/vim-fish'

call plug#end()

"" Basic settings {{{1

set clipboard+=unnamedplus
set complete+=k  " Enable dictionary completion
set cursorline
set diffopt+=vertical
set expandtab
set fileformat=unix
set fileformats=unix,dos,mac
set hidden  " Hide a buffer instead of unloading it
set ignorecase
set infercase
set list
set listchars=eol:¬,tab:>_,trail:_,extends:»,precedes:«,nbsp:_
set mouse=a
set nowrap
set nrformats=  " Only dicimal numbers are allowed for <CTRL-A/X>
set number
" set scroll=5
set scrolloff=4
set shiftwidth=4
set showbreak=»
set showmatch
set smartcase
set smartindent
set softtabstop=-1
set textwidth=78
set virtualedit=all
set visualbell
set undofile
set wildignorecase
set wildmode=list:longest

"" Color scheme and status line {{{1

if $COLORTERM == 'truecolor'  " VTE, Konsole, and iTerm2
  set termguicolors
endif
set background=light
colorscheme lucius

augroup lucius_color_tweaks
  autocmd!
  au VimEnter,ColorScheme * hi Search    gui=bold guifg=fg guibg=#afd7ff
  au VimEnter,ColorScheme * hi IncSearch gui=bold guifg=fg guibg=#afd7ff
augroup END

if !exists("g:lightline") | let g:lightline = {} | endif
let g:lightline.colorscheme = 'PaperColor'  " TODO: Lucius Light/Dark theme

"" Text objects {{{1

"" Separators of connected-words.without_spaces.likeThis
let g:wordmotion_spaces = '_-.'

"" UI enhancements {{{1

"" '%%' expands to '%:h'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

augroup remember_last_cursor_position
  autocmd!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exec "normal g`\"" |
        \ endif
augroup END

"" Colorize columns over &textwidth
exec 'set colorcolumn=+' . join(range(1, 256), ',+')

"" Use ripgrep if available
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"" Set <Leader> resp. <LocalLeader> to ';' resp. ',' by using clever-f
let g:mapleader = ';'
let g:maplocalleader = ','
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_repeat_last_char_inputs = ["\<Tab>"]

"" Search the text at the cursor or selected in visual mode
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N

" vim: fdm=marker sw=2 et

scriptencoding utf-8

"" Set base directories before loading init scripts
let s:config_home = (exists('$XDG_CONFIG_HOME') ? $XDG_CONFIG_HOME : $HOME . '/.config') . '/nvim'
let s:data_home = (exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . '/.local/share') . '/nvim'
let s:cache_home = (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME . '/.cache') . '/nvim'

if exists('*minpac#init') "{{{1
  call minpac#init({'dir': s:data_home . '/site'})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "" Basic settings
  call minpac#add('tpope/vim-sensible')

  "" Color scheme and status line
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('jonathanfilip/vim-lucius')

  "" Text objects
  call minpac#add('chaoren/vim-wordmotion')  " replaces CamelCaseMotion
  call minpac#add('glts/vim-textobj-comment')
  call minpac#add('kana/vim-textobj-indent')
  call minpac#add('kana/vim-textobj-user')  " required by the other textobj plugins
  call minpac#add('wellle/targets.vim')

  "" UI enhancements
  call minpac#add('houtsnip/vim-emacscommandline')
  " call minpac#add('jiangmiao/auto-pairs')  " vim-surround provides it by <C-S>
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('rhysd/clever-f.vim')
  call minpac#add('thinca/vim-visualstar')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')

  "" Language settings
  call minpac#add('LnL7/vim-nix')
  call minpac#add('mnacamura/vim-fish')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

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

"" Hack for vim + fish problem:
if &shell =~# '/fish$'
  let $SHELL = system('which sh')
  let &shell = $SHELL
endif

"" Color scheme and status line {{{1

if $COLORTERM ==# 'truecolor'  " VTE, Konsole, and iTerm2
  set termguicolors
endif
set background=light

try
  colorscheme lucius
catch /\v^Vim%(\(\a+\))=:E185/
  " Suppress error messages
endtry

augroup lucius_color_tweaks
  autocmd!
  au VimEnter,ColorScheme * hi Search    gui=bold guifg=fg guibg=#afd7ff
  au VimEnter,ColorScheme * hi IncSearch gui=bold guifg=fg guibg=#afd7ff
augroup END

if !exists('g:lightline') | let g:lightline = {} | endif
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

"" Use `ga` for aligning instead of showing the ASCII value at the cursor
nnoremap gA ga
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

"" Language settings {{{1

augroup lang_viml "{{{2
  autocmd!
  au FileType vim setl shiftwidth=2
augroup END

augroup lang_fish "{{{2
  autocmd!
  au FileType fish setl shiftwidth=2
augroup END


" vim: fdm=marker sw=2 et

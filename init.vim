"" Set base directories before loading init scripts
let g:config_home = (exists('$XDG_CONFIG_HOME') ? $XDG_CONFIG_HOME : $HOME . "/.config") . "/nvim"
let g:data_home = (exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . "/.local/share") . "/nvim"
let g:cache_home = (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME . "/.cache") . "/nvim"

call plug#begin(g:data_home . '/plugged') "{{{
Plug 'itchyny/lightline.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'tpope/vim-sensible'
call plug#end()
"}}}
"{{{ Color scheme and status line

set termguicolors
set background=light
colorscheme lucius

augroup lucius_color_tweaks
  autocmd!
  au VimEnter,ColorScheme * hi Search    gui=bold guifg=fg guibg=#afd7ff
  au VimEnter,ColorScheme * hi IncSearch gui=bold guifg=fg guibg=#afd7ff
augroup END

if !exists("g:lightline") | let g:lightline = {} | endif
let g:lightline.colorscheme = 'PaperColor'  " TODO: Lucius Light/Dark theme

"}}}

" vim: fdm=marker sw=2 et

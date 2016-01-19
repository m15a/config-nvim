" ==============================================================================
" MacVim settings for GUI
" Last Change: 2016-01-19 16:36.
" ==============================================================================

"{{{ Key Maps

"" Toggle fullscreen
function! ToggleFullScreen ()
  if &g:fullscreen
    set nofullscreen
  else
    set fullscreen
  endif
endfunction
nnoremap <silent> <Leader>m :call ToggleFullScreen ()<CR>

"}}}
"{{{ Look and Feel

winpos 470 40

set columns=100
set lines=40
set linespace=1
set vb t_vb=
set mousehide
set imdisable
set ch=1 " make command line two lines high
set guicursor=a:blinkon0 " cursor blinking off
set guioptions+=a " enable mouse paste
set guioptions+=c " use console dialogs instead of popup doalogs
set guioptions-=T " hide tool bar
set guioptions-=b " hide bottom scrollbar
set guioptions-=r " hide right scrollbar
set guioptions-=L " hide left scrollbar

"" Color on Japanese IM
au BufRead,BufNewFile,FileType * hi IMLine guifg=#303030
set transparency=20

"" Color scheme
set background=dark
let g:solarized_menu = 0
colorscheme solarized

"" Fonts
set termencoding=japan
set gfn=SourceCodePro-Regular:h16
set gfw=Rounded\ Mgen+\ 1m\ Regular:h16

"}}}

" vim: foldmethod=marker

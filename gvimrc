" ==============================================================================
" MacVim settings for GUI
" Last Change: 2013-01-09 15:28.
" ==============================================================================

"{{{ KEY MAPS

""{{{ Toggle fullscreen
function! g:gvimrc_toggle_fullscreen()
  if &g:fullscreen
    set nofullscreen
  else
    set fullscreen
  endif
endfunction
nnoremap <silent> <Leader>m :call g:gvimrc_toggle_fullscreen()<CR>
""}}}

"}}}
"{{{ LOOK AND FEEL

winpos 560 30

""{{{ Some 'set ...'
set columns=86
set lines=36
set linespace=0
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
""}}}
""{{{ Color on Japanese IM
au BufRead,BufNewFile,FileType * hi IMLine guifg=#303030
set transparency=10
""}}}
""{{{ Color scheme
" set background=dark
" let g:solarized_menu = 0
" colorscheme solarized
colorscheme Tomorrow-Night
""}}}
""{{{ Other highlights
"" See http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" au BufRead,BufNewFile,FileType * hi Normal       guifg=#BCBCBC
" au BufRead,BufNewFile,FileType * hi Cursor                     guibg=#EEB422
au BufRead,BufNewFile,FileType * hi DiffAdd      guifg=#001E27 guibg=#5F5FAF
au BufRead,BufNewFile,FileType * hi DiffChange   guifg=#001E27 guibg=#5F8787
au BufRead,BufNewFile,FileType * hi DiffText     guifg=#001E27 guibg=#5F5FAF
au BufRead,BufNewFile,FileType * hi DiffDelete   guifg=#FF5F00 guibg=#875F5F
""}}}
""{{{ Fonts
set termencoding=japan
set gfn=Inconsolata:h20
set gfw=Hiragino_Maru_Gothic_Pro:h20
""}}}

"}}}

" vim: foldmethod=marker

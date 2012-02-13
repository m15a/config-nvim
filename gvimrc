""" Configurations for MacVim with KaoriYa
""" Last change: 2012-02-13 17:54:45.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Look and feel

winpos 560 30
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
"" color on Japanese input method
au BufRead,BufNewFile,FileType * hi IMLine guifg=#303030
set transparency=10

"" Color scheme for use in GVIM
" let moria_style='dark'
" colorscheme moria
" colorscheme Sunburst
set background=dark
colorscheme hemisu
au BufRead,BufNewFile,FileType * hi Normal                     guibg=#1C1C1C
au BufRead,BufNewFile,FileType * hi Visual       guifg=#303030 guibg=#D7D787
au BufRead,BufNewFile,FileType * hi StatusLine   guifg=#303030 guibg=#EEEEEE
au BufRead,BufNewFile,FileType * hi StatusLineNC guifg=#303030 guibg=#9E9E9E
au BufRead,BufNewFile,FileType * hi Cursor                     guibg=#EEB422
au BufRead,BufNewFile,FileType * hi CursorLine                 guibg=#303030
au BufRead,BufNewFile,FileType * hi DiffAdd                    guibg=#303060
au BufRead,BufNewFile,FileType * hi DiffChange                 guibg=#306030
au BufRead,BufNewFile,FileType * hi DiffText                   guibg=#284A28
au BufRead,BufNewFile,FileType * hi DiffDelete   guifg=#C0C0C0 guibg=#603030
au BufRead,BufNewFile,FileType * hi IncSearch    guifg=#870000 guibg=#FFAFD7
au BufRead,BufNewFile,FileType * hi Search       guifg=#870000 guibg=#FFAFD7
au BufRead,BufNewFile,FileType * hi MatchParen   guifg=#303030 guibg=#AFD7FF
au BufRead,BufNewFile,FileType * hi Comment      guifg=#AEAEAE
au BufRead,BufNewFile,FileType * hi LineNr       guifg=#444444


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Key maps

"" Toggle fullscreen
function! ToggleFullScreen()
  if &g:fullscreen
    set nofullscreen
  else
    set fullscreen
  endif
endfunction
nnoremap <silent> <Leader>m :call ToggleFullScreen()<CR>

"" Fonts
set termencoding=japan
set gfn=Inconsolata:h20
set gfw=Hiragino_Maru_Gothic_Pro:h20


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins


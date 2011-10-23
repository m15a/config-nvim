""" Configurations for MacVim with KaoriYa
""" Last change: 2011-10-24 07:39:45.

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
colorscheme Sunburst
au BufRead,BufNewFile,FileType * hi Normal                     guibg=#262626
au BufRead,BufNewFile,FileType * hi Visual       guifg=#303030 guibg=#D7D787
au BufRead,BufNewFile,FileType * hi StatusLine   guifg=#303030 guibg=#EEEEEE
au BufRead,BufNewFile,FileType * hi StatusLineNC guifg=#303030 guibg=#9E9E9E
au BufRead,BufNewFile,FileType * hi Cursor                     guibg=#EEB422
au BufRead,BufNewFile,FileType * hi CursorLine                 guibg=#303030
au BufRead,BufNewFile,FileType * hi DiffAdd      guifg=#303030 guibg=#5F5FAF
au BufRead,BufNewFile,FileType * hi DiffChange   guifg=#303030 guibg=#5F875F
au BufRead,BufNewFile,FileType * hi DiffText     guifg=#303030 guibg=#5F8787
au BufRead,BufNewFile,FileType * hi DiffDelete   guifg=#FF5F00 guibg=#875F5F
au BufRead,BufNewFile,FileType * hi IncSearch    guifg=#870000 guibg=#FFAFD7
au BufRead,BufNewFile,FileType * hi Search       guifg=#870000 guibg=#FFAFD7

"" Fonts
set termencoding=japan
set gfn=Inconsolata:h20
set gfw=Hiragino_Maru_Gothic_Pro:h20


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins


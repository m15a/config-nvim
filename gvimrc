""" Configurations for MacVim with KaoriYa
""" Last change: 2011-10-25 16:07:31.

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
au BufRead,BufNewFile,FileType * hi DiffAdd                    guibg=#303060
au BufRead,BufNewFile,FileType * hi DiffChange                 guibg=#306030
au BufRead,BufNewFile,FileType * hi DiffText                   guibg=#284A28
au BufRead,BufNewFile,FileType * hi DiffDelete   guifg=#C0C0C0 guibg=#603030
au BufRead,BufNewFile,FileType * hi IncSearch    guifg=#870000 guibg=#FFAFD7
au BufRead,BufNewFile,FileType * hi Search       guifg=#870000 guibg=#FFAFD7
au BufRead,BufNewFile,FileType * hi MatchParen   guifg=#303030 guibg=#AFD7FF

"" Fonts
set termencoding=japan
set gfn=Inconsolata:h20
set gfw=Hiragino_Maru_Gothic_Pro:h20


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins


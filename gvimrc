""" Configurations for MacVim with KaoriYa
""" Last change: 2011/04/10 03:21:00.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Look and feel

winpos 560 30
set columns=86
set lines=36
set linespace=0
set vb t_vb=
set mousehide
set ch=1 " make command line two lines high
set guicursor=a:blinkon0 " cursor blinking off
set guioptions+=a " enable mouse paste
set guioptions+=c " use console dialogs instead of popup doalogs
set guioptions-=T " hide tool bar
set guioptions-=b " hide bottom scrollbar
set guioptions-=r " hide right scrollbar
set guioptions-=L " hide left scrollbar
hi IMLine guifg=Gray14 " color on Japanese input method
set transparency=10

"" Color scheme for use in GVIM
let moria_style='dark'
colorscheme moria
hi StatusLine guifg=#303030 guibg=#F2F2F2
hi StatusLineNC guifg=#303030 guibg=#A3A3A3
hi DiffAdd guibg=#BCE3FF guifg=#303030
hi DiffChange guibg=#CAFFB9 guifg=#303030
hi DiffText guibg=#99FF6F guifg=#303030
hi DiffDelete guibg=#FFBFBB guifg=#303030

"" Fonts
set termencoding=japan
set gfn=Inconsolata:h20
set gfw=Hiragino_Maru_Gothic_Pro:h20

"" Colorized completion (VIM7)
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=12
hi PmenuSbar ctermbg=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins


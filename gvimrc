""" Configurations for MacVim with KaoriYa
""" Last change: 17-Jan-2011.
  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Look and feel

winpos 566 764
set columns=86
set lines=40
set linespace=1
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
set transparency=10 " Transparency

"" Color scheme
let moria_style='dark'
colorscheme moria

"" Fonts
set termencoding=japan
set gfn=Osaka-Mono:h16
set gfw=Osaka-Mono:h16

"" Colorized completion (VIM7)
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=12
hi PmenuSbar ctermbg=0


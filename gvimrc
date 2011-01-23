""" Configurations for MacVim with KaoriYa
""" Last change: 2011/01/21 07:53:10.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Look and feel

winpos 576 770
set columns=86
set lines=42
set linespace=4
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
"" Transparency
function DefaultTransparency()
  set transparency=10
endfunction
call DefaultTransparency()

"" Color scheme
let moria_style='dark'
colorscheme moria

"" Fonts
set termencoding=japan
set gfn=Inconsolata:h16
set gfw=Hiragino_Maru_Gothic_Pro:h16

"" Colorized completion (VIM7)
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=12
hi PmenuSbar ctermbg=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins

"" vimspell
hi SpellErrors guifg=Red2 gui=underline

"" Conque
" Conque を呼び出したあと透明化がおかしくなるためリフレッシュする
command! -nargs=+ -complete=shellcmd ConqueTerm call conque_term#open(<q-args>) | call DefaultTransparency()
command! -nargs=+ -complete=shellcmd ConqueTermSplit call conque_term#open(<q-args>, ['belowright split']) | call DefaultTransparency()
command! -nargs=+ -complete=shellcmd ConqueTermVSplit call conque_term#open(<q-args>, ['belowright vsplit']) | call DefaultTransparency()
command! -nargs=+ -complete=shellcmd ConqueTermTab call conque_term#open(<q-args>, ['tabnew']) | call DefaultTransparency()


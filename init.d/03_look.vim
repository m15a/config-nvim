set termguicolors                     " True-color support
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 " Change the cursor shape in the terminal

"" Colorize columns over &textwidth: http://hanschen.org/2012/10/24/
exec 'set colorcolumn=+' . join(range(1, 256), ',+')

"" Color definitions in onedark.vim 
let s:black   = { "gui": "#282C34", "cterm": "235" }
let s:white   = { "gui": "#ABB2BF", "cterm": "145" }
let s:red     = { "gui": "#E06C75", "cterm": "204" }
let s:dred    = { "gui": "#BE5046", "cterm": "196" }  " s:dark_red
let s:green   = { "gui": "#98C379", "cterm": "114" }
let s:yellow  = { "gui": "#E5C07b", "cterm": "180" }
let s:dyellow = { "gui": "#D19A66", "cterm": "173" }  " s:dark_yellow
let s:blue    = { "gui": "#61AFEF", "cterm":  "39" }
let s:purple  = { "gui": "#C678DD", "cterm": "170" }
let s:cyan    = { "gui": "#56B6C2", "cterm":  "38" }
let s:vgrey   = { "gui": "#3E4452", "cterm": "237" }  " s:vidual_grey
let s:sgrey   = { "gui": "#3B4048", "cterm": "238" }  " s:special_grey

"" Change Search/IncSearch colors
augroup nvimrc_searchcolor
  autocmd!
  au VimEnter,ColorScheme *
        \ exec "hi Search"
        \          "ctermfg=" s:black.cterm "ctermbg=" s:cyan.cterm
        \          "guifg="   s:black.gui   "guibg="   s:cyan.gui
  au VimEnter,ColorScheme *
        \ exec "hi IncSearch"
        \          "ctermfg=" s:black.cterm "ctermbg=" s:cyan.cterm
        \          "guifg="   s:black.gui   "guibg="   s:cyan.gui
augroup END

" onedark.vim {{{

let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
colorscheme onedark

"}}}
" lightline.vim {{{

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

"}}}
" vim-buftabline {{{

let g:buftabline_show = 1
augroup nvimrc_buftabline
  autocmd!
  au VimEnter,ColorScheme *
        \ exec "hi BufTabLineCurrent"
        \          "ctermfg=" s:black.cterm "ctermbg=" s:green.cterm
        \          "guifg="   s:black.gui   "guibg="   s:green.gui
augroup END

"}}}
" vim-indent-guides {{{

augroup nvimrc_indentguides
  autocmd!
  au VimEnter,ColorScheme *
        \ exec "hi IndentGuidesOdd" "ctermbg=" s:sgrey.cterm "guibg=" s:sgrey.gui
augroup END

"}}}
" vim-signify {{{

augroup nvimrc_signify
  autocmd!
  " au VimEnter,ColorScheme * hi SignColumn guibg=#6f7783
  au VimEnter,ColorScheme *
        \ exec "hi SignifySignAdd"
        \          "ctermfg=" s:black.cterm "guifg=" s:black.gui
        \          "ctermbg=" s:green.cterm "guibg=" s:green.gui
  au VimEnter,ColorScheme *
        \ exec "hi SignifySignChange"
        \          "ctermfg=" s:black.cterm   "guifg=" s:black.gui
        \          "ctermbg=" s:dyellow.cterm "guibg=" s:dyellow.gui
  au VimEnter,ColorScheme *
        \ exec "hi SignifySignDelete"
        \          "ctermfg=" s:black.cterm "guifg=" s:black.gui
        \          "ctermbg=" s:red.cterm   "guibg=" s:red.gui
augroup END

"}}}
" deoplete.nvim {{{

augroup nvimrc_deoplete
  autocmd!
  au VimEnter,ColorScheme *
        \ exec "hi PmenuSel"
        \          "ctermfg=" s:black.cterm "ctermbg=" s:white.cterm
        \          "guifg="   s:black.gui   "guibg="   s:white.gui
augroup END

"}}}

" vim: foldmethod=marker

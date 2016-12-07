set termguicolors                     " True-color support
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 " Change the cursor shape in the terminal

"" Colorize columns over &textwidth: http://hanschen.org/2012/10/24/
exec 'set colorcolumn=+' . join(range(1, 256), ',+')

"" Color definitions in onedark.vim
let s:black   = { 'gui': '#282C34', 'cterm': '235' }
let s:white   = { 'gui': '#ABB2BF', 'cterm': '145' }
let s:red     = { 'gui': '#E06C75', 'cterm': '204' }
let s:dred    = { 'gui': '#BE5046', 'cterm': '196' }  " s:dark_red
let s:green   = { 'gui': '#98C379', 'cterm': '114' }
let s:yellow  = { 'gui': '#E5C07b', 'cterm': '180' }
let s:dyellow = { 'gui': '#D19A66', 'cterm': '173' }  " s:dark_yellow
let s:blue    = { 'gui': '#61AFEF', 'cterm':  '39' }
let s:purple  = { 'gui': '#C678DD', 'cterm': '170' }
let s:cyan    = { 'gui': '#56B6C2', 'cterm':  '38' }
let s:cgrey   = { 'gui': '#2C323C', 'cterm': '236' }  " s:cursor_grey
let s:vgrey   = { 'gui': '#3E4452', 'cterm': '237' }  " s:vidual_grey
let s:sgrey   = { 'gui': '#3B4048', 'cterm': '238' }  " s:special_grey

"" Change Search/IncSearch colors
augroup nvimrc_searchcolor
  autocmd!
  au VimEnter,ColorScheme *
        \ exec 'hi Search'
        \          'ctermfg=' s:black.cterm 'ctermbg=' s:cyan.cterm
        \          'guifg='   s:black.gui   'guibg='   s:cyan.gui
  au VimEnter,ColorScheme *
        \ exec 'hi IncSearch'
        \          'ctermfg=' s:black.cterm 'ctermbg=' s:cyan.cterm
        \          'guifg='   s:black.gui   'guibg='   s:cyan.gui
augroup END

"" Dark theme for terminal and light theme for writing
let s:iterm_profile = $ITERM_PROFILE
let g:nvimrc_term_writing = (match(s:iterm_profile, 'writing') > 0 ? 1 : 0)
if g:nvimrc_term_writing
  set background=light
else
  set background=dark
endif

" vim-one {{{

let g:one_allow_italics = 1
colorscheme one

"" TODO: Loading vim-one somehow changes bg to light. Should be fixed.
if g:nvimrc_term_writing
  set background=light
else
  set background=dark
endif

"}}}
" lightline.vim {{{

let g:lightline = {
      \ 'colorscheme': 'one',
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
        \ exec "hi IndentGuidesOdd ctermbg=" s:sgrey.cterm "guibg=" s:sgrey.gui
augroup END

"}}}
" vim-signify {{{

augroup nvimrc_signify
  autocmd!
  au VimEnter,ColorScheme *
        \ exec "hi SignColumn ctermbg=" s:cgrey.cterm "guibg=" s:cgrey.gui
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

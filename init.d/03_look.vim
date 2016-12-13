set termguicolors                     " True-color support
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 " Change the cursor shape in the terminal

"" Dark theme for terminal and light theme for writing
let g:nvimrc_background_light = match($ITERM_PROFILE, 'writing') > 0 ? 1 : 0
if g:nvimrc_background_light
  set background=light
else
  set background=dark
endif

"" Colorize columns over &textwidth: http://hanschen.org/2012/10/24/
exec 'set colorcolumn=+' . join(range(1, 256), ',+')
augroup nvimrc_colorcolumn
  autocmd!
  if g:nvimrc_background_light
    "" Two Firewatch Light
    au VimEnter,ColorScheme * hi ColorColumn guifg=#896724
  else
    "" Two Firewatch Dark
    au VimEnter,ColorScheme * hi ColorColumn guifg=#abb2bf
  endif
augroup END

"" Change Search/IncSearch colors
augroup nvimrc_searchcolor
  autocmd!
  "" Two Firewatch Dark and Light
  au VimEnter,ColorScheme * hi Search    guifg=#282c34 guibg=#56b6c2
  au VimEnter,ColorScheme * hi IncSearch guifg=#282c34 guibg=#56b6c2 gui=none
augroup END

" vim-one {{{

let g:one_allow_italics = 1
let g:one_disable_cterm_support = 1
" colorscheme one

"}}}
" vim-two-firewatch {{{

let g:two_firewatch_italics = 1
let g:two_firewatch_disable_cterm = 1
colorscheme two-firewatch

"}}}
" lightline.vim {{{

if !exists("g:lightline")
  let g:lightline = {}
endif
let g:lightline.colorscheme = 'one'

"}}}
" vim-buftabline {{{

let g:buftabline_show = 1
augroup nvimrc_buftabline
  autocmd!
  if g:nvimrc_background_light
    "" Two Firewatch Light
    au VimEnter,ColorScheme * exec 'hi BufTabLineCurrent guifg=#faf8f5 guibg=#896724'
  else
    "" Two Firewatch Dark
    au VimEnter,ColorScheme * exec 'hi BufTabLineCurrent guifg=#282c34 guibg=#abb2bf'
  endif
  au VimEnter,ColorScheme * exec 'hi BufTabLineActive  guifg= guibg='
  au VimEnter,ColorScheme * exec 'hi BufTabLineHidden  guifg= guibg='
augroup END

"}}}
" vim-signify {{{

augroup nvimrc_signify
  autocmd!
  au VimEnter,ColorScheme * hi SignColumn guibg=none
  if g:nvimrc_background_light
    "" Two Firewatch Light
    au VimEnter,ColorScheme * hi SignifySignAdd    guifg=#e5ddcb guibg=#43d08a
    au VimEnter,ColorScheme * hi SignifySignChange guifg=#e5ddcb guibg=#e0c285
    au VimEnter,ColorScheme * hi SignifySignDelete guifg=#e5ddcb guibg=#e05252 gui=bold
  else
    "" Two Firewatch Dark
    au VimEnter,ColorScheme * hi SignifySignAdd    guifg=#3e4452 guibg=#43d08a
    au VimEnter,ColorScheme * hi SignifySignChange guifg=#3e4452 guibg=#e0c285
    au VimEnter,ColorScheme * hi SignifySignDelete guifg=#3e4452 guibg=#e05252 gui=bold
  endif
augroup END

"}}}
" deoplete.nvim {{{

augroup nvimrc_deoplete
  autocmd!
  if !g:nvimrc_background_light
    "" Two Firewatch Dark
    au VimEnter,ColorScheme * hi PmenuSel guifg=#3e4452 guibg=#abb2bf
  endif
augroup END

"}}}

" vim: foldmethod=marker

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

if g:nvimrc_background_light
  "" Color definitions in vim-one light background
  let s:black        = '#FAFAFA'
  let s:white        = '#494B53'
  let s:light_red    = '#E45649'
  let s:dark_red     = '#CA1243'
  let s:green        = '#50A14F'
  let s:light_yellow = '#C18401'
  let s:dark_yellow  = '#986801'
  let s:blue         = '#4078F2'
  let s:magenta      = '#A626A4'
  let s:cyan         = '#0184BC'
  let s:gutter_grey  = '#9E9E9E'
  let s:comment_grey = '#A0A1A7'
else
  "" Color definitions in vim-one dark background
  let s:black        = '#282C34'
  let s:white        = '#ABB2BF'
  let s:light_red    = '#E06C75'
  let s:dark_red     = '#BE5046'
  let s:green        = '#98C379'
  let s:light_yellow = '#E5C07b'
  let s:dark_yellow  = '#D19A66'
  let s:blue         = '#61AFEF'
  let s:magenta      = '#C678DD'
  let s:cyan         = '#56B6C2'
  let s:gutter_grey  = '#3B4048'
  let s:comment_grey = '#5C6370'
end

"" Change Search/IncSearch colors
augroup nvimrc_searchcolor
  autocmd!
  au VimEnter,ColorScheme * exec 'hi Search    guifg=' s:black 'guibg=' s:cyan
  au VimEnter,ColorScheme * exec 'hi IncSearch guifg=' s:black 'guibg=' s:cyan
augroup END

" vim-one {{{

let g:one_allow_italics = 1
let g:one_disable_cterm_support = 1
colorscheme one

"}}}
" vim-two-firewatch {{{

let g:two_firewatch_italics = 1
let g:two_firewatch_disable_cterm = 1
" colorscheme two-firewatch

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
  au VimEnter,ColorScheme * exec 'hi BufTabLineCurrent guifg=' s:black 'guibg=' s:green
augroup END

"}}}
" vim-indent-guides {{{

augroup nvimrc_indentguides
  autocmd!
  au VimEnter,ColorScheme * exec "hi IndentGuidesOdd guibg=" s:gutter_grey
augroup END

"}}}
" vim-signify {{{

augroup nvimrc_signify
  autocmd!
  au VimEnter,ColorScheme * exec 'hi SignColumn                         guibg=' s:comment_grey
  au VimEnter,ColorScheme * exec 'hi SignifySignAdd    guifg=' s:black 'guibg=' s:green
  au VimEnter,ColorScheme * exec 'hi SignifySignChange guifg=' s:black 'guibg=' s:dark_yellow
  au VimEnter,ColorScheme * exec 'hi SignifySignDelete guifg=' s:black 'guibg=' s:light_red
augroup END

"}}}
" deoplete.nvim {{{

augroup nvimrc_deoplete
  autocmd!
  au VimEnter,ColorScheme * exec "hi PmenuSel guifg=" s:black "guibg=" s:white
augroup END

"}}}

" vim: foldmethod=marker

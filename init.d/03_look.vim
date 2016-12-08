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
  let s:black        = { 'gui': '#FAFAFA', 'cterm': '255' }
  let s:white        = { 'gui': '#494B53', 'cterm': '23'  }
  let s:light_red    = { 'gui': '#E45649', 'cterm': '166' }
  let s:dark_red     = { 'gui': '#CA1243', 'cterm': '160' }
  let s:green        = { 'gui': '#50A14F', 'cterm': '71'  }
  let s:light_yellow = { 'gui': '#C18401', 'cterm': '136' }
  let s:dark_yellow  = { 'gui': '#986801', 'cterm': '94'  }
  let s:blue         = { 'gui': '#4078F2', 'cterm': '33'  }
  let s:magenta      = { 'gui': '#A626A4', 'cterm': '127' }
  let s:cyan         = { 'gui': '#0184BC', 'cterm': '31'  }
  let s:gutter_grey  = { 'gui': '#9E9E9E', 'cterm': '246' }
  let s:comment_grey = { 'gui': '#A0A1A7', 'cterm': '145' }
else
  "" Color definitions in vim-one dark background
  let s:black        = { 'gui': '#282C34', 'cterm': '16'  }
  let s:white        = { 'gui': '#ABB2BF', 'cterm': '145' }
  let s:light_red    = { 'gui': '#E06C75', 'cterm': '168' }
  let s:dark_red     = { 'gui': '#BE5046', 'cterm': '130' }
  let s:green        = { 'gui': '#98C379', 'cterm': '114' }
  let s:light_yellow = { 'gui': '#E5C07b', 'cterm': '180' }
  let s:dark_yellow  = { 'gui': '#D19A66', 'cterm': '173' }
  let s:blue         = { 'gui': '#61AFEF', 'cterm': '75'  }
  let s:magenta      = { 'gui': '#C678DD', 'cterm': '176' }
  let s:cyan         = { 'gui': '#56B6C2', 'cterm': '73'  }
  let s:gutter_grey  = { 'gui': '#3B4048', 'cterm': '60'  }
  let s:comment_grey = { 'gui': '#5C6370', 'cterm': '59'  }
end

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

" vim-one {{{

let g:one_allow_italics = 1
colorscheme one

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
        \ exec "hi IndentGuidesOdd ctermbg=" s:gutter_grey.cterm "guibg=" s:gutter_grey.gui
augroup END

"}}}
" vim-signify {{{

augroup nvimrc_signify
  autocmd!
  au VimEnter,ColorScheme *
        \ exec "hi SignColumn ctermbg=" s:comment_grey.cterm "guibg=" s:comment_grey.gui
  au VimEnter,ColorScheme *
        \ exec "hi SignifySignAdd"
        \          "ctermfg=" s:black.cterm "guifg=" s:black.gui
        \          "ctermbg=" s:green.cterm "guibg=" s:green.gui
  au VimEnter,ColorScheme *
        \ exec "hi SignifySignChange"
        \          "ctermfg=" s:black.cterm       "guifg=" s:black.gui
        \          "ctermbg=" s:dark_yellow.cterm "guibg=" s:dark_yellow.gui
  au VimEnter,ColorScheme *
        \ exec "hi SignifySignDelete"
        \          "ctermfg=" s:black.cterm "guifg=" s:black.gui
        \          "ctermbg=" s:light_red.cterm   "guibg=" s:light_red.gui
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

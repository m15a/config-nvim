set termguicolors                      " True-color support
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1  " Change the cursor shape in the terminal

"" Colorize columns over &textwidth: http://hanschen.org/2012/10/24/
exec 'set colorcolumn=+' . join(range(1, 256), ',+')

" lucius {{{

set background=light
colorscheme lucius

augroup lucius_color_tweaks
  autocmd!
  au VimEnter,ColorScheme * hi Search guifg=fg guibg=#afd7ff
  au VimEnter,ColorScheme * hi IncSearch guifg=fg guibg=#afd7ff
augroup END

"}}}
" lightline.vim {{{

if !exists("g:lightline")
  let g:lightline = {}
endif
let g:lightline.colorscheme = 'PaperColor'  " TODO: Lucius Light/Dark theme

"}}}

" vim: foldmethod=marker

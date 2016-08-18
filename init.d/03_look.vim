set termguicolors                     " True-color support
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 " Change the cursor shape in the terminal

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
  au VimEnter,ColorScheme * hi BufTabLineCurrent guifg=#282c34 guibg=#9ac27c
augroup END

"}}}

"" Colorize columns over 80: http://hanschen.org/2012/10/24/
exec 'set colorcolumn=' . join(range(81, 335), ',')

" vim: foldmethod=marker

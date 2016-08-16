"" Change the cursor shape in the terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"" True-color support
set termguicolors

"" Atom One Dark theme
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
colorscheme onedark

"" Lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

"" Buftabline
let g:buftabline_show = 1
augroup nvimrc_buftabline
  autocmd!
  au VimEnter,ColorScheme * hi BufTabLineCurrent guifg=black guibg=#9ac27c
augroup END

"" Colorize columns over 80
"" See http://hanschen.org/2012/10/24/
exec 'set colorcolumn=' . join(range(81, 335), ',')

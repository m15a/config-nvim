"" One Dark theme
colorscheme onedark

"" Highlight current cursor line only
augroup vimrc_current_cursor_line
  autocmd! vimrc_current_cursor_line
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

"" Colorize columns over 80: http://hanschen.org/2012/10/24/
exec "set colorcolumn=" . join (range (81, 335), ',')

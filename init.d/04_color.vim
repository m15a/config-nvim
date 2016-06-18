"" True-color support
set termguicolors

"" Atom One Dark theme
colorscheme onedark

"" Highlight current cursor line number (gutter)
"" Here, colors are tuned to One Dark theme.
hi CursorLine   ctermbg=none
hi CursorLineNr ctermfg=235   " black
hi CursorLineNr ctermbg=110   " cyan
augroup current_cursor_gutter
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"" Colorize columns over 80: http://hanschen.org/2012/10/24/
exec "set colorcolumn=" . join(range(81, 335), ',')

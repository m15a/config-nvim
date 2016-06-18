"" True-color support
set termguicolors

"" Atom One Dark theme
colorscheme onedark

"" Colorize columns over 80
"" See http://hanschen.org/2012/10/24/
exec "set colorcolumn=" . join(range(81, 335), ',')

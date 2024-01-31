local M = {}

M.diagnostic_symbols = {
   Error = ' ',
   Warn = ' ',
   Hint = ' ',
   Info = ' ',
}

M.border_chars = {
   northwest = '╭',
   north = '─',
   northeast = '╮',
   east = '│',
   southeast = '╯',
   south = '─',
   southwest = '╰',
   west = '│',
}

return M

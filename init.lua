local u = require'my.utils'
local env = vim.env
local o = vim.o

require'my.options'
require'my.plugins'

-- Hack for vim + fish problem.
env.SHELL = '/run/current-system/sw/bin/bash'
o.shell = env.SHELL

u.augroup('remember_last_cursor_position', function(au)
  au [[BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal g`\"" | endif]]
end)

u.augroup('filetype_lua', function(au)
  au [[FileType lua setlocal shiftwidth=2]]
end)

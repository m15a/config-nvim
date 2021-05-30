local u = require'my.utils'

u.augroup('filetype_lua', function(au)
  au [[FileType lua setlocal shiftwidth=2]]
end)

u.augroup('filetype_vim', function(au)
  au [[FileType vim setlocal shiftwidth=2]]
end)

u.augroup('filetype_make', function(au)
  au [[FileType make setlocal tabstop=4]]
end)

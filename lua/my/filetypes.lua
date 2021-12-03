local v = require 'my.utils.vimsl'

v.augroup('filetype_lua', function(au)
   au [[FileType lua setlocal shiftwidth=3]]
end)

v.augroup('filetype_vim', function(au)
   au [[FileType vim setlocal shiftwidth=2]]
end)

v.augroup('filetype_make', function(au)
   au [[FileType make setlocal tabstop=4]]
end)

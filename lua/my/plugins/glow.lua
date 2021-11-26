local v = require'my.utils.vimsl'

v.augroup('glow', function(au)
  au [[FileType markdown nnoremap <buffer> <silent> <Space> <Cmd>Glow<CR>]]
end)

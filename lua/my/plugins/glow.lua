local v = require'my.utils.vimsl'

local toggle_map = '<Space>'
local filetypes = {
  'markdown',
  'markdown.gfm',
  'markdown.pandoc',
  'glowpreview',
}

local cmd = table.concat({
  'FileType',
  table.concat(filetypes, ','),
  'nnoremap',
  '<buffer>',
  '<silent>',
  toggle_map,
  '<Cmd>Glow<CR>',
}, ' ')
v.augroup('glow', function(au)
  au(cmd)
end)

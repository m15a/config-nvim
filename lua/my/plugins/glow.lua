local v = require'my.utils.vimsl'

local toggle_map = '<Space>'
local filetypes = {
  'markdown',
  'markdown.gfm',
  'markdown.pandoc',
  'glowpreview',
}

v.augroup('glow', function(au)
  au {
    'FileType',
    table.concat(filetypes, ','),
    'nnoremap',
    '<buffer>',
    '<silent>',
    toggle_map,
    '<Cmd>Glow<CR>',
  }
end)

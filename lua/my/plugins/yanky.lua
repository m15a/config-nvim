require('yanky').setup {}

local map = vim.keymap.set

map({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
map({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
map({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
map({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')

map('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
map('n', '<c-n>', '<Plug>(YankyNextEntry)')

map('n', ']p', '<Plug>(YankyPutIndentAfterLinewise)')
map('n', '[p', '<Plug>(YankyPutIndentBeforeLinewise)')
map('n', ']P', '<Plug>(YankyPutIndentAfterLinewise)')
map('n', '[P', '<Plug>(YankyPutIndentBeforeLinewise)')

map('n', '>p', '<Plug>(YankyPutIndentAfterShiftRight)')
map('n', '<p', '<Plug>(YankyPutIndentAfterShiftLeft)')
map('n', '>P', '<Plug>(YankyPutIndentBeforeShiftRight)')
map('n', '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)')

map('n', '=p', '<Plug>(YankyPutAfterFilter)')
map('n', '=P', '<Plug>(YankyPutBeforeFilter)')

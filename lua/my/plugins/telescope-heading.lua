require'telescope'.load_extension('heading')

local map = require'my.utils.telescope'.set_keymap

map('H', '<Cmd>Telescope heading sorting_strategy=ascending<CR>')

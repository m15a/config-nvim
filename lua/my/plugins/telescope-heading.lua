local map = require'my.utils.telescope'.set_keymap

require'telescope'.load_extension('heading')

map('h', '<Cmd>Telescope heading sorting_strategy=ascending<CR>')

require('telescope').load_extension 'heading'

local tmap = require('my.keymap').set_telescope

tmap('#', '<Cmd>Telescope heading sorting_strategy=ascending<CR>')

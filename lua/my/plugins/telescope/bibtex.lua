require('telescope').load_extension 'bibtex'

local tmap = require('my.keymap').set_telescope

tmap('r', '<Cmd>Telescope bibtex<CR>')

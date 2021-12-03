require('telescope').load_extension 'bibtex'

local map = require('my.keymaps').set_telescope_keymap

map('R', '<Cmd>Telescope bibtex<CR>')

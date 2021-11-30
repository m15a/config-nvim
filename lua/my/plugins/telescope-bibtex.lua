require'telescope'.load_extension('bibtex')

local map = require'my.utils.telescope'.set_keymap

map('R', '<Cmd>Telescope bibtex<CR>')

local map = require'my.utils.telescope'.set_keymap

vim.api.nvim_set_keymap('', '[telescope]', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<Leader>e', '[telescope]', {})
vim.api.nvim_set_keymap('n', '<Leader>E', '<Cmd>Telescope builtin<CR>', {silent = true})

map('b', '<Cmd>Telescope buffers<CR>')
map('f', '<Cmd>Telescope find_files<CR>')
map('e', '<Cmd>Telescope resume<CR>')

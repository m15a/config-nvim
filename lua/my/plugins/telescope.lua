local map = vim.api.nvim_set_keymap

map('', '[telescope]', '<Nop>', {noremap = true})
map('', '<Leader>e', '[telescope]', {})

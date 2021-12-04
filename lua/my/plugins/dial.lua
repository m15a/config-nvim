local map = vim.api.nvim_set_keymap

map('n', '<C-a>', '<Plug>(dial-increment)', { silent = true })
map('n', '<C-x>', '<Plug>(dial-decrement)', { silent = true })
map('v', '<C-a>', '<Plug>(dial-increment)', { silent = true })
map('v', '<C-x>', '<Plug>(dial-decrement)', { silent = true })
map('v', 'g<C-a>', '<Plug>(dial-increment-additional)', { silent = true })
map('v', 'g<C-x>', '<Plug>(dial-decrement-additional)', { silent = true })

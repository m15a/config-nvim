local map = vim.api.nvim_set_keymap

require'telescope'.load_extension('heading')

map('n', '[telescope]h', '<Cmd>Telescope heading sorting_strategy=ascending<CR>', {silent = true})

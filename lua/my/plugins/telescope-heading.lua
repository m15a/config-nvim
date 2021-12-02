require("telescope").load_extension("heading")

local map = require("my.keymaps").set_telescope_keymap

map("H", "<Cmd>Telescope heading sorting_strategy=ascending<CR>")

local todo = require 'todo-comments'
local map = vim.keymap.set

todo.setup {}

local function todo_prev()
   todo.jump_prev()
end
local function todo_next()
   todo.jump_next()
end
map('n', '[t', todo_prev, { desc = 'Previous TODO comment' })
map('n', ']t', todo_next, { desc = 'Next TODO comment' })

map('n', '[telescope]t', '<Cmd>TodoTelescope<CR>', { desc = 'Open TODOs in Telescope' })

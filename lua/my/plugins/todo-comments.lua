local todo = require 'todo-comments'

todo.setup {}

local function todo_prev()
   todo.jump_prev()
end
local function todo_next()
   todo.jump_next()
end
local map = vim.keymap.set
map('n', '[t', todo_prev, { desc = 'Previous TODO comment' })
map('n', ']t', todo_next, { desc = 'Next TODO comment' })

local tmap = require('my.keymap').set_telescope
tmap('t', '<Cmd>TodoTelescope<CR>', { desc = 'Open TODOs in Telescope' })

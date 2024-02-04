local s = require 'substitute'
local yanky_ok, y = pcall(require 'yanky.integration')
local map = vim.keymap.set

local config = {}
if yanky_ok then
   config = vim.tbl_deep_extend('force', config, {
      on_substitute = y.substitute(),
   })
end
s.setup(config)

-- Substitute operator
map('n', 's', s.operator, { desc = 'Substitute text of a motion with a register' })
map('x', 's', s.visual, { desc = 'Substitute visual with a register' })
map('n', 'ss', s.line, { desc = 'Substitute the current line with a register' })
map('n', 'S', s.eol, { desc = 'Substitute text up to the end of line with a register' })

-- Exchange operator
local x = require 'substitute.exchange'
map('n', 'cx', x.operator, { desc = 'Exchange two texts of motions' })
map('x', 'X', x.visual, { desc = 'Exchange two viduals' })
map('n', 'cxx', x.line, { desc = 'Exchange two lines' })

-- Substitute over range motion
-- Too much for me!
--[[
local r = require 'substitute.range'
map('n', '<Leader>s', r.operator, { desc = 'Substitute text of a motion over a range' })
map('x', '<Leader>s', r.visual, { desc = 'Substitute visual over a range' })
map('x', '<Leader>ss', r.visual, { desc = 'Substitute cursor word over a range' })
]]

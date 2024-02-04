local mode = { 'n', 'o', 'x' }

local function cmd(key)
   return "<Cmd>lua require'spider'.motion'" .. key .. "'<CR>"
end

for _, key in ipairs { 'w', 'e', 'b' } do
   vim.keymap.set(mode, key, cmd(key), { desc = 'Spider-' .. key })
end

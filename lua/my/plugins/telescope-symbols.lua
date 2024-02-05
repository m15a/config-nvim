local function format_sources(sources)
   local quoted = {}
   for i, source in ipairs(sources) do
      quoted[i] = "'" .. source .. "'"
   end
   return '{' .. table.concat(quoted, ',') .. '}'
end

local keymaps = {
   ['E'] = { 'emoji' },
   ['G'] = { 'gitmoji' },
   ['$'] = { 'latex' },
}

local tmap = require('my.keymap').set_telescope
local cmd = "<Cmd>lua require'telescope.builtin'.symbols{sources=%s}<CR>"
for key, srcs in pairs(keymaps) do
   tmap(key, string.format(cmd, format_sources(srcs)))
end

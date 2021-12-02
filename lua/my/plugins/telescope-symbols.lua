local function format_sources(sources)
  local quoted = {}
  for i, source in ipairs(sources) do
    quoted[i] = "'" .. source .. "'"
  end
  return "{" .. table.concat(quoted, ",") .. "}"
end

local keymaps = {
  ["S"] = { "math", "latex", "emoji", "gitmoji" },
}

local map = require("my.keymaps").set_telescope_keymap
local cmd = "<Cmd>lua require'telescope.builtin'.symbols{sources=%s}<CR>"
for key, srcs in pairs(keymaps) do
  map(key, string.format(cmd, format_sources(srcs)))
end

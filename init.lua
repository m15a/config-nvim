local function require_(name)
  -- If the required script returns a module, then call setup().
  -- Otherwise, it is simply a setup script.
  local mod = require(name)
  if type(mod) == "boolean" then
      return mod
  end
  mod.setup()
end

require_("my.options")
require_("my.plugins")
require_("my.filetypes")
require_("my.hacks")

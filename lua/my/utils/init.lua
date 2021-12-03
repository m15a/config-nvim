local M = {}

function M.require(name)
   -- If the required script returns a module, then call setup().
   -- Otherwise, it is simply a setup script.
   local mod = require(name)
   if type(mod) == "boolean" then
      return mod
   end
   if type(mod) == "table" then
      mod.setup()
      return mod
   end
   return false
end

return M

local M = {}

function M.has_exec(name)
   return function()
      return vim.fn.executable(name) > 0
   end
end

function M.has_any_file(names)
   return function(utils)
      for _, name in ipairs(names) do
         if utils.root_has_file(name) then
            return true
         end
      end
      return false
   end
end

function M.has_file(name_or_names)
   local fn
   if type(name_or_names) == 'table' then
      fn = M.has_any_file(name_or_names)
   else
      fn = M.has_any_file { name_or_names }
   end
   return fn
end

return M

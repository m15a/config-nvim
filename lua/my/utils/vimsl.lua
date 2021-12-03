-- Utility functions as a DSL for Vim commands

local M = {}

-- :augroup 'name' ... :augroup END
-- Usage:
--   local vimsl = require'my.utils.vimsl'
--   vimsl.augroup('name', function(au)
--     au [[ string ]]
--     au {'table', 'of', 'string'}
--   end)
function M.augroup(name, autocmds)
   local lines = {
      'augroup ' .. name,
      'autocmd!',
   }
   autocmds(function(line)
      if type(line) == 'table' then
         line = table.concat(line, ' ')
      end
      table.insert(lines, 'autocmd ' .. line)
   end)
   table.insert(lines, 'augroup END')
   vim.cmd(table.concat(lines, '\n'))
end

-- :colorscheme 'name'
function M.colorscheme(name)
   vim.cmd('colorscheme ' .. name)
end

return M

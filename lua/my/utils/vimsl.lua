-- Utility functions as a DSL for Vim commands

local vimsl = {}

-- :augroup 'name' ... :augroup END
-- Usage:
--   local vimsl = require'my.utils.vimsl'
--   vimsl.augroup('name', function(au)
--     au [[ ... ]]
--     au [[ ... ]]
--   end)
function vimsl.augroup(name, autocmds)
  local lines = {
    'augroup ' .. name,
    'autocmd!'
  }
  autocmds(function(line)
    table.insert(lines, 'autocmd ' .. line)
  end)
  table.insert(lines, 'augroup END')
  vim.cmd(table.concat(lines, '\n'))
end

-- :colorscheme 'name'
function vimsl.colorscheme(name)
  vim.cmd('colorscheme ' .. name)
end

return vimsl
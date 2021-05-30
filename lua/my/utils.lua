local utils = {}

-- :augroup 'name' ... :augroup END
-- Usage:
--   utils.augroup('name', function(au)
--     au [[ ... ]]
--     au [[ ... ]]
--   end)
function utils.augroup(name, autocmds)
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
function utils.colorscheme(name)
  vim.cmd('colorscheme ' .. name)
end

return utils

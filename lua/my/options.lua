local u = require'my.utils'
local o = vim.o
local wo = vim.wo

-- Need to be set via vim command until neovim/neovim/pull/13479 is merged.
do
  local options = {
    undofile = true,
    textwidth = 100,
    shiftwidth = 4,
    softtabstop = -1,
    expandtab = true,
    infercase = true,
    smartindent = true,
  }
  for k, v in pairs(options) do u.set(k, v) end
end

o.hidden = true
o.mouse = 'nv'
o.visualbell = true
o.scrolloff = 5
o.diffopt = o.diffopt .. ',vertical'
o.listchars = 'eol:¬,tab:›_,trail:_,extends:»,precedes:«,nbsp:_'
o.showbreak = '»'
o.showmatch = true
o.virtualedit = 'block'
o.wildmode = 'list:longest'
o.ignorecase = true
o.smartcase = true
o.wildignorecase = true
o.path = '.,,'

wo.number = true
wo.list = true
wo.cursorline = true
wo.colorcolumn = (function()
  local colorcolumn = {}
  for i = 1, 256 do table.insert(colorcolumn, '+' .. i) end
  return table.concat(colorcolumn, ',')
end)()

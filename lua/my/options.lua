local env = vim.env
local o = vim.opt
local wo = vim.wo
local g = vim.g

o.clipboard = 'unnamedplus'
o.undofile = true
o.textwidth = 80
o.shiftwidth = 4
o.softtabstop = -1
o.expandtab = true
o.infercase = true
o.smartindent = true
o.hidden = true
o.mouse = 'nv'
o.visualbell = true
o.scrolloff = 5
o.diffopt:append 'vertical'
o.listchars = {
   eol = '¬',
   tab = '›_',
   trail = '_',
   extends = '»',
   precedes = '«',
   nbsp = '_',
}
o.showbreak = '»'
o.showmatch = true
o.virtualedit = 'block'
o.wildmode = 'list:longest'
o.ignorecase = true
o.smartcase = true
o.wildignorecase = true
o.path = '.,,'
o.termguicolors = env.COLORTERM == 'truecolor'
o.showmode = false

wo.number = true
wo.list = true
wo.cursorline = true
wo.colorcolumn = (function()
   local colorcolumn = {}
   for i = 1, 256 do
      table.insert(colorcolumn, '+' .. i)
   end
   return table.concat(colorcolumn, ',')
end)()

-- Mouse click can do the same.
g.netrw_nogx = true

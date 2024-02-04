local namespace = ...
local utils = require 'my.utils'

local function require_(basename)
   utils.require(namespace .. '.' .. basename)
end

if not vim.g.disable_paq then
   require_ 'paq'
end

require_ 'autoclose'
require_ 'bullets'
require_ 'clever-f'
require_ 'comment'
require_ 'dial'
require_ 'feline'
require_ 'gfm-syntax'
require_ 'gitsigns'
require_ 'glow'
require_ 'lastplace'
require_ 'lspconfig'
require_ 'lspkind'
require_ 'marks'
require_ 'null-ls'
require_ 'numb'
require_ 'pandoc-syntax'
require_ 'pqf'
require_ 'purescript'
require_ 'sentiment'
require_ 'spider'
require_ 'srcerite'
require_ 'stcursorword'
require_ 'substitute'
require_ 'surround'
require_ 'table-mode'
require_ 'telescope'
require_ 'telescope-bibtex'
require_ 'telescope-heading'
require_ 'telescope-symbols'
require_ 'todo-comments'
require_ 'treesitter'
require_ 'various-textobjs'
require_ 'web-devicons'
require_ 'yanky'

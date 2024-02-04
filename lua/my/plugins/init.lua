local namespace = ...
local utils = require 'my.utils'

local function require_(basename)
   utils.require(namespace .. '.' .. basename)
end

if not vim.g.disable_paq then
   require_ 'paq'
end

require_ 'autoclose'
require_ 'comment'
require_ 'lightspeed'
require_ 'lspkind'
require_ 'null-ls'
require_ 'lspconfig'
require_ 'treesitter'
require_ 'sandwich'
require_ 'marks'
require_ 'telescope'
require_ 'telescope-symbols'
require_ 'srcerite'
require_ 'web-devicons'
require_ 'feline'
require_ 'gitsigns'
require_ 'bullets'
require_ 'glow'
require_ 'gfm-syntax'
require_ 'pandoc-syntax'
require_ 'stcursorword'
require_ 'table-mode'
require_ 'telescope-heading'
require_ 'telescope-bibtex'
require_ 'pqf'
require_ 'numb'
require_ 'dial'
require_ 'lastplace'
require_ 'purescript'

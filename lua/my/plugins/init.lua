local namespace = ...
local utils = require 'my.utils'

local function require_(basename)
   utils.require(namespace .. '.' .. basename)
end

require_ 'paq'

require_ 'astronauta'
require_ 'lightspeed'
require_ 'lspactions'
require_ 'lspkind'
require_ 'null-ls'
require_ 'lspconfig'
require_ 'treesitter'
require_ 'sandwich'
require_ 'telescope'
require_ 'telescope-symbols'
require_ 'srcery'
require_ 'web-devicons'
require_ 'feline'
require_ 'gitsigns'
require_ 'bullets'
require_ 'glow'
require_ 'gfm-syntax'
require_ 'pandoc-syntax'
require_ 'table-mode'
require_ 'telescope-heading'
require_ 'telescope-bibtex'
require_ 'iron'
require_ 'pqf'
require_ 'numb'
require_ 'dial'
require_ 'lastplace'

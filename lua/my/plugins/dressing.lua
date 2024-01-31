local assets = require 'my.assets'

local border = {
   assets.border_chars.northwest,
   assets.border_chars.north,
   assets.border_chars.northeast,
   assets.border_chars.east,
   assets.border_chars.southeast,
   assets.border_chars.south,
   assets.border_chars.southwest,
   assets.border_chars.west,
}

require('dressing').setup {
   input = {
      border = border,
   },
   select = {
      backend = { 'telescope', 'builtin' },
      border = border,
   },
   builtin = {
      border = border,
   },
}

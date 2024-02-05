local colors = require 'my.plugins.feline.colors'

return {
   ['NORMAL'] = colors.normal,
   ['OP'] = colors.normal,
   ['INSERT'] = colors.insert,
   ['VISUAL'] = colors.visual,
   ['LINES'] = colors.visual,
   ['BLOCK'] = colors.visual,
   ['REPLACE'] = colors.replace,
   ['V-REPLACE'] = colors.replace,
   ['ENTER'] = colors.enter,
   ['MORE'] = colors.enter,
   ['SELECT'] = colors.select,
   ['COMMAND'] = colors.command,
   ['SHELL'] = colors.command,
   ['TERM'] = colors.command,
   ['NONE'] = colors.none,
}

local srcery = require 'srcerite.srcery'

return {
   fg = srcery.bright_white,
   bg = srcery.hard_black,
   sides = srcery.orange,

   error = srcery.bright_red,
   warn = srcery.bright_yellow,
   hint = srcery.bright_cyan,
   info = srcery.bright_green,

   normal = srcery.bright_green,
   insert = srcery.bright_yellow,
   visual = srcery.bright_orange,
   replace = srcery.red,
   enter = srcery.cyan,
   select = srcery.bright_orange,
   command = srcery.magenta,
   none = srcery.white,
}

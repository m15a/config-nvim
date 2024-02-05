local srcery = {}
for name, spec in pairs(require 'srcerite.srcery') do
   srcery[name] = spec[1]
end

return {
   fg = srcery.bright_white,
   bg = srcery.xgray1,
   sides = srcery.bright_black,

   error = srcery.red,
   warn = srcery.orange,
   hint = srcery.magenta,
   info = srcery.bright_magenta,

   normal = srcery.blue,
   insert = srcery.green,
   visual = srcery.magenta,
   replace = srcery.red,
   enter = srcery.cyan,
   select = srcery.orange,
   command = srcery.bright_blue,
   none = srcery.white,
}

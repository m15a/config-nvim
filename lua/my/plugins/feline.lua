local vi_mode = require 'feline.providers.vi_mode'
local ds = require('my.assets').diagnostic_signs

local srcery = {}
for name, spec in pairs(require 'srcerite.srcery') do
   srcery[name] = spec[1]
end

local colors = {
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

local vi_mode_colors = {
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

local components = { active = {}, inactive = {} }

components.active[1] = {
   {
      provider = '▊ ',
      hl = { fg = colors.sides, bg = colors.bg },
   },
   {
      provider = 'vi_mode',
      icon = '',
      hl = function()
         return {
            name = vi_mode.get_mode_highlight_name(),
            fg = vi_mode.get_mode_color(),
            bg = colors.bg,
            style = 'bold',
         }
      end,
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = {
         name = 'file_info',
         opts = {
            type = 'relative',
            file_readonly_icon = ' ',
         },
      },
      short_provider = {
         name = 'file_info',
         opts = {
            type = 'relative-short',
            file_readonly_icon = ' ',
         },
      },
      hl = { fg = colors.fg, bg = colors.bg },
      left_sep = '',
      right_sep = '',
   },
   { hl = { bg = colors.bg } },
}
components.active[2] = {
   {
      provider = 'diagnostic_errors',
      icon = ds.Error .. ' ',
      hl = { fg = colors.error, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_warnings',
      icon = ds.Warn .. ' ',
      hl = { fg = colors.warn, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_hints',
      icon = ds.Hint .. ' ',
      hl = { fg = colors.hint, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_info',
      icon = ds.Info .. ' ',
      hl = { fg = colors.info, bg = colors.bg },
      left_sep = '',
   },
   { hl = { bg = colors.bg } },
}
components.active[3] = {
   {
      provider = 'file_format',
      hl = { fg = colors.fg, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'file_encoding',
      hl = { fg = colors.fg, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'file_type',
      hl = { fg = colors.fg, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'position',
      hl = { fg = colors.fg, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'scroll_bar',
      hl = { fg = colors.sides, bg = colors.bg },
      left_sep = '',
      right_sep = '',
   },
   { hl = { bg = colors.bg } },
}

components.inactive[1] = {
   components.active[1][3], -- file_info
   { hl = { bg = colors.bg } },
}
components.inactive[2] = {
   -- pass
   { hl = { bg = colors.bg } },
}
components.inactive[3] = {
   components.active[3][4], -- position
   { hl = { bg = colors.bg } },
}

require('feline').setup {
   components = components,
   vi_mode_colors = vi_mode_colors,
   colors = colors,
}

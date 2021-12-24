local vi_mode = require 'feline.providers.vi_mode'

local kanagawa = require 'kanagawa.colors'

local colors = {
   fg = kanagawa.fg,
   bg = kanagawa.bg,
   sides = kanagawa.sumiInk4,

   error = kanagawa.diag.error,
   warn = kanagawa.diag.warning,
   hint = kanagawa.diag.hint,
   info = kanagawa.diag.info,

   normal = kanagawa.blue,
   insert = kanagawa.green,
   visual = kanagawa.magenta,
   replace = kanagawa.red,
   enter = kanagawa.cyan,
   select = kanagawa.surimiOrange,
   command = kanagawa.lightBlue,
   none = kanagawa.white,
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
      icon = ' ',
      hl = { fg = colors.error, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_warnings',
      icon = ' ',
      hl = { fg = colors.warn, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_hints',
      icon = ' ',
      hl = { fg = colors.hint, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_info',
      icon = ' ',
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

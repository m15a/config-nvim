local vi_mode = require 'feline.providers.vi_mode'
local diagnostic_signs = require('my.assets').diagnostic_signs
local colors = require 'my.plugins.feline.colors'

local M = { active = {}, inactive = {} }

M.active[1] = {
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
M.active[2] = {
   {
      provider = 'diagnostic_errors',
      icon = diagnostic_signs.Error .. ' ',
      hl = { fg = colors.error, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_warnings',
      icon = diagnostic_signs.Warn .. ' ',
      hl = { fg = colors.warn, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_hints',
      icon = diagnostic_signs.Hint .. ' ',
      hl = { fg = colors.hint, bg = colors.bg },
      left_sep = '',
      right_sep = { str = ' ', hl = { bg = colors.bg } },
   },
   {
      provider = 'diagnostic_info',
      icon = diagnostic_signs.Info .. ' ',
      hl = { fg = colors.info, bg = colors.bg },
      left_sep = '',
   },
   { hl = { bg = colors.bg } },
}
M.active[3] = {
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

M.inactive[1] = {
   M.active[1][3], -- file_info
   { hl = { bg = colors.bg } },
}
M.inactive[2] = {
   -- pass
   { hl = { bg = colors.bg } },
}
M.inactive[3] = {
   M.active[3][4], -- position
   { hl = { bg = colors.bg } },
}

return M

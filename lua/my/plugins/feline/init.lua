local components = require 'my.plugins.feline.components'
local vi_mode_colors = require 'my.plugins.feline.vi_mode_colors'
local colors = require 'my.plugins.feline.colors'

require('feline').setup {
   components = components,
   vi_mode_colors = vi_mode_colors,
   colors = colors,
}

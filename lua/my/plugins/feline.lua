local g = vim.g

local srcery = {
  black     = g.srcery_black,
  red       = g.srcery_red,
  green     = g.srcery_red,
  yellow    = g.srcery_yellow,
  blue      = g.srcery_blue,
  magenta   = g.srcery_magenta,
  cyan      = g.srcery_cyan,
  white     = g.srcery_white,
  brblack   = g.srcery_bright_black,
  brred     = g.srcery_bright_red,
  brgreen   = g.srcery_bright_green,
  bryellow  = g.srcery_bright_yellow,
  brblue    = g.srcery_bright_blue,
  brmagenta = g.srcery_bright_magenta,
  brcyan    = g.srcery_bright_cyan,
  brwhite   = g.srcery_bright_white,
  orange    = g.srcery_orange,
  brorange  = g.srcery_bright_orange,
  hardblack = g.srcery_hard_black,
  xgray1    = g.srcery_xgray1,
  xgray2    = g.srcery_xgray2,
  xgray3    = g.srcery_xgray3,
  xgray4    = g.srcery_xgray4,
  xgray5    = g.srcery_xgray5,
  xgray6    = g.srcery_xgray6,
}

local colors = vim.tbl_extend('error', srcery, {
  fg = srcery.brwhite,
  bg = srcery.black,
  violet = srcery.magenta,
  skyblue = srcery.brblue,
  oceanlue = srcery.blue,
})

require'feline'.setup {
  preset = 'noicon',
  colors = colors,
}

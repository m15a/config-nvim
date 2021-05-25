local u = require'my.utils'
local g = vim.g

vim.cmd 'packadd paq-nvim'
local use = require'paq-nvim'.paq

use {'savq/paq-nvim', opt = true} -- {{{1

use 'nvim-lua/plenary.nvim' -- {{{1

use 'srcery-colors/srcery-vim' -- {{{1
g.srcery_italic = true
g.srcery_dim_lisp_paren = true
g.srcery_transparent_background = true
u.colorscheme 'srcery'

use 'famiu/feline.nvim' -- {{{1
do
  local srcery = {
    black     = '#1C1B19',
    red       = '#EF2F27',
    green     = '#519F50',
    yellow    = '#FBB829',
    blue      = '#2C78BF',
    magenta   = '#E02C6D',
    cyan      = '#0AAEB3',
    white     = '#D0BFA1',
    brblack   = '#918175',
    brred     = '#F75341',
    brgreen   = '#98BC37',
    bryellow  = '#FED06E',
    brblue    = '#68A8E4',
    brmagenta = '#FF5C8F',
    brcyan    = '#53FDE9',
    brwhite   = '#FCE8C3',
    orange    = '#D75F00',
    brorange  = '#FF8700',
    hardblack = '#121212',
    xgray1    = '#262626',
    xgray2    = '#303030',
    xgray3    = '#3A3A3A',
    xgray4    = '#444444',
    xgray5    = '#4E4E4E',
    xgray6    = '#585858',
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
end

use 'lewis6991/gitsigns.nvim' -- {{{1
require'gitsigns'.setup {
  signs = {
    add = {hl = 'GitGutterAdd'},
    change = {hl = 'GitGutterChange'},
    delete = {hl = 'GitGutterDelete'},
    topdelete = {hl = 'GitGutterDelete'},
    changedelete = {hl = 'GitGutterChangeDelete'},
  },
}

use 'kyazdani42/nvim-web-devicons' -- {{{1
require'nvim-web-devicons'.setup {
  default = true,
}

use 'rhysd/clever-f.vim' -- {{{1
-- Use ';' and ',' as <Leader> and <LocalLeader> since they are now freed.
g.mapleader = ';'
g.maplocalleader = ','
g.clever_f_smart_case = true
g.clever_f_use_migemo = true

use 'houtsnip/vim-emacscommandline' -- {{{1

use 'tpope/vim-unimpaired' -- {{{1

use 'tpope/vim-repeat' -- {{{1

use 'chaoren/vim-wordmotion' -- {{{1

use 'tyru/caw.vim' -- {{{1

use 'thinca/vim-visualstar' -- {{{1

-- }}}

-- vim: fdm=marker

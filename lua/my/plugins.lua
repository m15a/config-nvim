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

use 'dkarter/bullets.vim' -- {{{1
g.bullets_enabled_file_types = {
  'gitcommit',
  'markdown',
  'pandoc',
  'text',
}
g.bullets_checkbox_markers = ' x'

use 'machakann/vim-sandwich' -- {{{1

use 'nvim-treesitter/nvim-treesitter' -- {{{1
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- Be consistent with unimpaired.vim.
      init_selection = "]g",
      node_incremental = "]g",
      node_decremental = "[g",
      scope_incremental = "]G",
    },
  },
  indent = {
    enable = true,
  },
}

use 'neovim/nvim-lspconfig' -- {{{1

-- }}}

-- vim: fdm=marker

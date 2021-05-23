local u = require'my.utils'
local g = vim.g

vim.cmd 'packadd paq-nvim'
local use = require'paq-nvim'.paq

use {'savq/paq-nvim', opt = true} -- {{{1

use 'srcery-colors/srcery-vim' -- {{{1
g.srcery_italic = true
g.srcery_dim_lisp_paren = true
g.srcery_transparent_background = true
u.colorscheme 'srcery'

use 'rhysd/clever-f.vim' -- {{{1
-- Use ';' and ',' as <Leader> and <LocalLeader> since they are now freed.
g.mapleader = ';'
g.maplocalleader = ','
g.clever_f_smart_case = true
g.clever_f_use_migemo = true

-- }}}

-- vim: fdm=marker

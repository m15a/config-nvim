local u = require'my.utils'
local g = vim.g

-- use 'srcery-colors/srcery-vim' {{{1
g.srcery_italic = true
g.srcery_dim_lisp_paren = true
g.srcery_transparent_background = true
u.colorscheme 'srcery'

-- use 'famiu/feline.nvim' {{{1
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

-- use 'lewis6991/gitsigns.nvim' {{{1
require'gitsigns'.setup {
  signs = {
    add = {hl = 'GitGutterAdd'},
    change = {hl = 'GitGutterChange'},
    delete = {hl = 'GitGutterDelete'},
    topdelete = {hl = 'GitGutterDelete'},
    changedelete = {hl = 'GitGutterChangeDelete'},
  },
}

-- use 'kyazdani42/nvim-web-devicons' {{{1
require'nvim-web-devicons'.setup {
  default = true,
}

-- use 'simrat39/symbols-outline.nvim' {{{1
g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true, -- experimental
  position = 'right',
  keymaps = {
    close = "<Esc>",
    goto_location = "<CR>",
    focus_location = "o",
    hover_symbol = "<Space>",
    rename_symbol = "r",
    code_actions = "a",
  },
  lsp_blacklist = {},
}

-- ggandor/lightspeed.nvim {{{1
require'lightspeed'.setup {
  exit_after_idle_msecs = {
    unlabeled = 1000,
    labeled = nil,
  },
}

-- machakann/vim-sandwich {{{1
-- Use vim-surround keymaps to resolve conflicts with lightspeed.nvim
vim.cmd [[runtime macros/sandwich/keymap/surround.vim]]
g['sandwich#recipes'] = (function()
  local recipes = g['sandwich#recipes']
  local extra_recipes = {
    { buns = {'( ', ' )'}, input = {'('} },
    { buns = {'[ ', ' ]'}, input = {'['} },
    { buns = {'{ ', ' }'}, input = {'{'} },
  }
  local options = {
    nesting = true,
    match_syntax = true,
    kind = {'add', 'replace'},
    action = {'add'},
  }
  for _, recipe in ipairs(extra_recipes) do
    for k, v in pairs(options) do recipe[k] = v end
    table.insert(recipes, recipe)
  end
  extra_recipes = {
    { buns = {'(\\s*', '\\s*)'}, input = {'('} },
    { buns = {'\\[\\s*', '\\s*\\]'}, input = {'['} },
    { buns = {'{\\s*', '\\s*}'}, input = {'{'} },
  }
  options = {
    nesting = true,
    match_syntax = true,
    regex = true,
    kind = {'delete', 'replace', 'textobj'},
    action = {'delete'},
  }
  for _, recipe in ipairs(extra_recipes) do
    for k, v in pairs(options) do recipe[k] = v end
    table.insert(recipes, recipe)
  end
  return recipes
end)()

-- use 'dkarter/bullets.vim' --{{{1
g.bullets_enabled_file_types = {
  'gitcommit',
  'markdown',
  'pandoc',
  'text',
}
g.bullets_checkbox_markers = ' x'

-- use 'nvim-treesitter/nvim-treesitter' {{{1
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"fennel"},
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

-- use 'npxbr/glow.nvim' {{{1
u.augroup('glow', function(au)
  au [[FileType markdown nnoremap <buffer> <silent> <Space> <Cmd>Glow<CR>]]
end)

-- vim-pandoc/vim-pandoc-syntax {{{1
g['pandoc#syntax#conceal#use'] = false

-- }}}
-- vim: fdm=marker

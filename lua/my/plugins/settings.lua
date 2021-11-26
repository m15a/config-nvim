local v = require'my.utils.vimsl'
local g = vim.g

-- use 'srcery-colors/srcery-vim' {{{1
g.srcery_italic = true
g.srcery_dim_lisp_paren = true
g.srcery_transparent_background = true
v.colorscheme 'srcery'

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


-- ggandor/lightspeed.nvim {{{1
require'lightspeed'.setup {
  exit_after_idle_msecs = {
    unlabeled = 1000,
    labeled = nil,
  },
}
g.mapleader = ';'
g.maplocalleader = ','

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

-- nvim-treesitter/nvim-treesitter{,-textobjects} {{{1
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
      "fennel",
    },
  },
  incremental_selection = {
    enable = false,  -- too much for me!
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- NOTE: 'ib' and 'ab' are reserved for selecting braces.
        -- Use 'v' since 'v' is next to 'b' in keyboard and easy to type.
        ['iv'] = '@block.inner',
        ['av'] = '@block.outer',
        ['iC'] = '@call.inner',
        ['aC'] = '@call.outer',
        ['ik'] = '@class.inner',
        ['ak'] = '@class.outer',
        ['ac'] = '@comment.outer',
        -- NOTE: 'i' is mnemonic for 'If'.
        ['ii'] = '@conditional.inner',
        ['ai'] = '@conditional.outer',
        -- NOTE: Below are supported for very few languages.
        -- ['if'] = '@frame.inner',
        -- ['af'] = '@frame.outer',
        -- NOTE: Use 'm' from 'Method' since 'f' reminds me of 'File'.
        ['im'] = '@function.inner',
        ['am'] = '@function.outer',
        ['il'] = '@loop.inner',
        ['al'] = '@loop.outer',
        ['ia'] = '@parameter.inner',
        ['aa'] = '@parameter.outer',
        -- ['in'] = '@scopename.inner',  -- NOTE: supported for vary few languages.
        ['aS'] = '@statement.outer',  -- NOTE: 'as' is reserved for sentence.
      },
    },
    swap = {
      -- FIXME: It does not work for me.
      -- See https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/96
      enable = false,
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]k"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]K"] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[k"] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[K"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["<LocalLeader>sm"] = "@function.outer",
        ["<LocalLeader>sk"] = "@class.outer",
      },
    },
  },
}

-- use 'npxbr/glow.nvim' {{{1
v.augroup('glow', function(au)
  au [[FileType markdown nnoremap <buffer> <silent> <Space> <Cmd>Glow<CR>]]
end)

-- rhysd/vim-gfm-syntax {{{1
g.gfm_syntax_enable_always = false
g.gfm_syntax_enable_filetypes = {
  'markdown.gfm',
}
v.augroup('gfm_syntax', function(au)
  au [[BufNewFile,BufRead README.md setl filetype=markdown.gfm]]
end)

-- vim-pandoc/vim-pandoc-syntax {{{1
g['pandoc#syntax#conceal#use'] = false

-- }}}
-- vim: fdm=marker

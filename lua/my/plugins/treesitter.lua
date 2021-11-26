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

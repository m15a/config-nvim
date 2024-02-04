require('autoclose').setup {
   keys = {
      ['('] = { escape = false, close = true, pair = '()' },
      ['['] = { escape = false, close = true, pair = '[]' },
      ['{'] = { escape = false, close = true, pair = '{}' },

      [')'] = { escape = true, close = false, pair = '()' },
      [']'] = { escape = true, close = false, pair = '[]' },
      ['}'] = { escape = true, close = false, pair = '{}' },

      ['"'] = { escape = true, close = true, pair = '""' },
      -- Single single-quote is used everywhere for variable names (e.g. x'),
      -- abbreviations (e.g., I don't think so), quasi-quote (e.g. '(a b c)), etc.
      -- ["'"] = { escape = true, close = true, pair = "''" },
      ['`'] = { escape = true, close = true, pair = '``' },
   },

   options = {
      -- Leave Lispy languages to parinfer.
      disabled_filetypes = {
         'lisp',
         'scheme',
         'clojure',
         'fennel',
      },
      disable_command_mode = true,
      disable_when_touch = true,
      pair_spaces = true,
      -- I don't think so.
   },
}

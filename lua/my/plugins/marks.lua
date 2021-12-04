require('marks').setup {
   builtin_marks = {
      '<',
      '>',
      "'",
      '^',
      '.',
   },
   excluded_filetypes = {
      '', -- for excluding those like LSP hover.
      'help',
      'TelescopePrompt',
      'TelescopeResults',
   },
}

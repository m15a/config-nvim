let g:signify_vcs_list = [ 'git', 'hg', 'darcs' ]

let g:signify_vcs_cmds =
      \ { 'git':   'git diff --no-color --no-ext-diff -U0 -- %f'
      \ , 'hg':    'hg diff --config extensions.color=! --config defaults.diff= --nodates -U0 -- %f'
      \ , 'darcs': 'darcs diff --no-pause-for-gui --diff-command="diff -rN -U0 %1 %2" -- %f'
      \ }

nnoremap <Leader>d :SignifyToggleHighlight<CR>

"" patdiff-like flavour
let g:signify_sign_add    = '+|'
" let g:signify_sign_delete = '_'
let g:signify_sign_change = '!|'
augroup nvimrc_scm
  autocmd!
  " au VimEnter,ColorScheme * hi SignColumn guibg=#6f7783
  au VimEnter,ColorScheme * hi SignifySignAdd    guifg=#282c34 guibg=#98c379
  au VimEnter,ColorScheme * hi SignifySignChange guifg=#282c34 guibg=#d19a66
  au VimEnter,ColorScheme * hi SignifySignDelete guifg=#282c34 guibg=#e06c75
augroup END

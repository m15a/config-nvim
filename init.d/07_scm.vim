let g:signify_disable_by_default = 1  " Too heavy for ubiquitous use

let g:signify_vcs_list = [ 'git', 'hg', 'darcs' ]
let g:signify_vcs_cmds =
      \ { 'git':   'git diff --no-color --no-ext-diff -U0 -- %f'
      \ , 'hg':    'hg diff --config extensions.color=! --config defaults.diff= --nodates -U0 -- %f'
      \ , 'darcs': 'darcs diff --no-pause-for-gui --diff-command="diff -rN -U0 %1 %2" -- %f'
      \ }

nnoremap <Leader>d :SignifyToggle<CR>
nnoremap <Leader>D :SignifyToggleHighlight<CR>

"" patdiff-like flavour
let g:signify_sign_add    = '+|'
" let g:signify_sign_delete = '_'
let g:signify_sign_change = '!|'

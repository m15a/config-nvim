let g:signify_vcs_list = [ 'git', 'hg', 'darcs' ]

let g:signify_vcs_cmds =
      \ { 'git':   'git diff --no-color --no-ext-diff -U0 -- %f'
      \ , 'hg':    'hg diff --config extensions.color=! --config defaults.diff= --nodates -U0 -- %f'
      \ , 'darcs': 'darcs diff --no-pause-for-gui --diff-command="diff -rN -U0 %1 %2" -- %f'
      \ }

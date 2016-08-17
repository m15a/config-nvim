augroup nvimrc_tmux
  autocmd!
  au FileType tmux setlocal omnifunc=syntaxcomplete#Complete
augroup END

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tmux =
      \ [ '[a-z]\w*'
      \ ]

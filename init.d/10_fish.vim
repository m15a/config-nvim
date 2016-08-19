augroup nvimrc_fish
  autocmd!
  au FileType fish compiler fish
  " au FileType fish setlocal foldmethod=expr
augroup END

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.fish =
      \ [ '[^\W\d]\w*'
      \ ]

" TODO: configure ctags and tagbar

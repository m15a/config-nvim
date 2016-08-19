let g:mma_candy = 1

augroup nvimrc_mathematica
  autocmd!
  au BufRead,BufNewFile *.m set filetype=mma
augroup END

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.mma =
      \ [ '\$'
      \ , '[A-Z]\w*'
      \ ]

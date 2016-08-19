augroup nvimrc_stan
  autocmd!
  au FileType stan setlocal omnifunc=syntaxcomplete#Complete
augroup END

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.stan = '[a-z]\w*'

" TODO: configure ctags and tagbar

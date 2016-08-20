augroup nvimrc_julia
  autocmd!
  "" This does not work
  " au FileType julia setlocal omnifunc=syntaxcomplete#Complete
  "" TODO: omni completion
augroup END

let g:julia_syntax_highlight_deprecated = 1

let g:tagbar_type_julia =
      \ { 'ctagstype' : 'julia'
      \ , 'kinds'     : ['f:functions']
      \ , 'sro'       : '.'
      \ }

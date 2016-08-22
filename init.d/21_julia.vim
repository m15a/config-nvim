augroup nvimrc_julia
  autocmd!
  au FileType julia setl shiftwidth=2 softtabstop=2
  "" This does not work
  " au FileType julia setl omnifunc=syntaxcomplete#Complete
  "" TODO: omni completion
augroup END

let g:julia_syntax_highlight_deprecated = 1

let g:tagbar_type_julia =
      \ { 'ctagstype' : 'julia'
      \ , 'kinds'     : [ 'a:abstract'
      \                 , 'i:immutable'
      \                 , 't:type'
      \                 , 'm:macro'
      \                 , 'f:function'
      \                 ]
      \ }

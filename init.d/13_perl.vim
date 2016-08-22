augroup nvimrc_perl
  autocmd!
  au FileType perl,perl6 setl shiftwidth=2 softtabstop=2
augroup END

let g:tagbar_type_perl6 =
      \ { 'ctagstype' : 'perl6'
      \ , 'kinds'     : [ 'c:classes'
      \                 , 'g:grammars'
      \                 , 'm:methods'
      \                 , 'o:modules'
      \                 , 'p:packages'
      \                 , 'r:roles'
      \                 , 'u:rules'
      \                 , 'b:submethods'
      \                 , 's:subroutines'
      \                 , 't:tokens'
      \                 ]
      \ }

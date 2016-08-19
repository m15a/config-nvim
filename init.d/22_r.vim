if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.r = '(?:[^\W\d_]|\.[^\d])[\w\.]*'

let g:tagbar_type_r =
      \ { 'ctagstype' : 'r'
      \ , 'kinds'     : [ 'f:Functions'
      \                 , 'g:GlobalVariables'
      \                 , 'v:FunctionVariables'
      \                 ]
      \ }

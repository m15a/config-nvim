let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2

let g:indent_guides_auto_colors = 0
augroup nvimrc_indentguides
  autocmd!
  au VimEnter,ColorScheme * hi IndentGuidesOdd guibg=#444444
augroup END

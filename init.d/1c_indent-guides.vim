" let g:indent_guides_guide_size = 1
au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
" let g:indent_guides_default_mapping = 0
" nnoremap <silent> <Leader>ig <Plug>IndentGuidesToggle

setl suffixes+=.aux,.bbl,.blg,.dvi,.end,.fls,.log,.out,.spl,.tdo,.toc

augroup nvimrc_tex
  autocmd!
  au FileType tex,bib,bst setl shiftwidth=2 softtabstop=2
  au FileType tex,bib,bst setl nojoinspaces spell conceallevel=0
augroup END

let g:vimtex_complete_close_braces = 1
" let g:vimtex_complete_recursive_bib = 1
let g:vimtix_delim_toggle_mod_list =
      \ [ ['\left', '\right']
      \ , ['\langle', '\rangle']
      \ ]
" let g:vimtex_format_enabled = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_latexmk_enabled = 0
let g:vimtex_view_enabled = 0

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . ')'

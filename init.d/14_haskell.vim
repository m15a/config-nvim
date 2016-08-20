augroup nvimrc_haskell
  autocmd!
  au FileType haskell setl shiftwidth=2 softtabstop=2

  au FileType haskell
        \ command! -buffer HaskellStylish exec '%!stylish-haskell'|
        \ command! -buffer -range HaskellPointfree
        \   call setline('.', split(system('pointfree ' .
        \     shellescape(join(getline(<line1>, <line2>), "\n"))), "\n"))|
        \ command! -buffer -range HaskellPointful
        \   call setline('.', split(system('pointful ' .
        \     shellescape(join(getline(<line1>, <line2>), "\n"))), "\n"))

  au FileType haskell
        \ noremap <buffer> [haskell] <Nop>|
        \ map <buffer> <LocalLeader>h [haskell]|
        \ nmap <buffer> [haskell]S :<C-u>HaskellStylish<CR>|
        \ nmap <buffer> [haskell]p :<C-u>HaskellPointfree<CR>|
        \ vmap <buffer> [haskell]p :HaskellPointfree<CR>|
        \ nmap <buffer> [haskell]P :<C-u>HaskellPointful<CR>|
        \ vmap <buffer> [haskell]P :HaskellPointful<CR>
augroup END

let g:haskell_vim_enable_quantification = 1
let g:haskell_vim_enable_recursivedo = 1
let g:haskell_vim_enable_arrowsyntax = 1
let g:haskell_vim_enable_pattern_synonyms = 1
let g:haskell_vim_enable_typeroles = 1
let g:haskell_vim_enable_static_pointers = 1

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2

let g:haskellmode_completion_ghc = 0
" let g:necoghc_enable_detailed_browse = 1

augroup nvimrc_necoghc
  autocmd!
  au FileType haskell setl omnifunc=necoghc#omnifunc
augroup END

augroup nvimrc_haskellsortimport
  autocmd!
  au FileType haskell nmap <buffer> [haskell]s :<C-u>HaskellSortImport<CR>
augroup END

let g:tagbar_type_haskell =
      \ { 'ctagsbin'   : 'hasktags'
      \ , 'ctagsargs'  : '-x -c -o-'
      \ , 'kinds'      : [ 'm:modules:0:1'
      \                  , 'd:data: 0:1'
      \                  , 'd_gadt: data gadt:0:1'
      \                  , 't:type names:0:1'
      \                  , 'nt:new types:0:1'
      \                  , 'c:classes:0:1'
      \                  , 'cons:constructors:1:1'
      \                  , 'c_gadt:constructor gadt:1:1'
      \                  , 'c_a:constructor accessors:1:1'
      \                  , 'ft:function types:1:1'
      \                  , 'fi:function implementations:0:1'
      \                  , 'o:others:0:1'
      \                  ]
      \ , 'sro'        : '.'
      \ , 'kind2scope' : { 'm' : 'module'
      \                  , 'c' : 'class'
      \                  , 'd' : 'data'
      \                  , 't' : 'type'
      \                  }
      \ , 'scope2kind' : { 'module' : 'm'
      \                  , 'class'  : 'c'
      \                  , 'data'   : 'd'
      \                  , 'type'   : 't'
      \                  }
      \ }

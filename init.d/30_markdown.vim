augroup nvimrc_markdown
  autocmd!
  au FileType markdown,markdown.pandoc,pandoc setl shiftwidth=2 softtabstop=2
  au FileType markdown,markdown.pandoc,pandoc setl spell
  au FileType markdown let b:timestamp_regexp =
        \   '\v\C%(<[Uu]pdated\s*:\s+)@<='
        \ . g:nvimrc_timestamp_datetime_regexp

  "" Could be replaced by tagbar using universal-ctags
  au FileType markdown,markdown.pandoc,pandoc nnoremap <Leader>l :<C-u>TOC<CR>
augroup END

let g:pandoc#modules#enabled =
      \ [ 'completion'
      \ , 'folding'
      \ , 'formatting'
      \ , 'metadata'
      \ , 'keyboard'
      \ , 'toc'
      \ , 'chdir'
      \ ]
let g:pandoc#after#modules#enabled = ['neosnippets']

let g:pandoc#formatting#equalprg = ''  " Use vim's default equalprg
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 80
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#toc#close_after_navigating = 0


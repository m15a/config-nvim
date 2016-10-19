augroup nvimrc_markdown
  autocmd!
  au FileType markdown,markdown.pandoc,pandoc setl shiftwidth=2 softtabstop=2
  au FileType markdown let b:timestamp_regexp =
        \   '\v\C%(<[Uu]pdated\s*:\s+)@<='
        \ . g:nvimrc_timestamp_datetime_regexp
augroup END

let g:pandoc#after#modules#enabled = ['neosnippets']
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 80
let g:pandoc#syntax#conceal#use = 0

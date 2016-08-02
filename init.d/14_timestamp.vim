Plug 'icersong/timestamp.vim'

let g:timestamp_rep = '%Y-%m-%d %H:%M:%S %Z'
let s:datetime_regexp =
      \   '\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2} ?%(<\u{2,3}>|[\+\-]\d{2}:?\d{2})?'
      \ . '|TIMESTAMP'

let timestamp_regexp =
      \   '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)@<='
      \ . s:datetime_regexp

au filetype markdown let b:timestamp_regexp =
      \   '\v\C%(<[Uu]pdated\s*:\s+)@<='
      \ . s:datetime_regexp

" vim: modelines=1

set fileformat=unix
set fileformats=unix,dos,mac

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932

"" 日本語を含まない場合は fileencoding に encoding を使う
autocmd BufReadPost *
  \ if &fileencoding =~# 'iso-2022-jp' && search ("[^\x01-\x7e]", 'n') == 0 |
  \   let &fileencoding = &encoding | endif

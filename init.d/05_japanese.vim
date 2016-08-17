scriptencoding utf-8

set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932

set ambiwidth=double   " □や○の文字があってもカーソル位置がずれないようにする。
set spelllang+=cjk     " 日本語をスペルチェックから除外する
set formatoptions+=mB  " 日本語の行同士の連結には空白を入力しない

set matchpairs+=（:）,「:」,『:』,【:】,［:］,〈:〉,《:》,‘:’,“:”

"" 全角スペースを強調表示
augroup nvimrc_showidegraphicspace
  autocmd!
  au VimEnter,Colorscheme * hi IdeographicSpace guibg=red
  au VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
"" http://qiita.com/ssh0/items/9e7f0d8b8f033183dd0b
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" JpFormat.vim {{{

set formatexpr=jpfmt#formatexpr()

"}}}

" vim: foldmethod=marker

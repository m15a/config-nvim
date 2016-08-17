scriptencoding utf-8

set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932

set spelllang+=cjk     " 日本語をスペルチェックから除外する
set formatoptions+=mB  " 日本語の行同士の連結には空白を入力しない

" JpFormat.vim {{{

set formatexpr=jpfmt#formatexpr()

"}}}

" vim: foldmethod=marker

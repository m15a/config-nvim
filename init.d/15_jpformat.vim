Plug 'fuenor/JpFormat.vim'

set formatexpr=jpfmt#formatexpr()
set formatoptions+=mM  " 日本語の行の連結時には空白を入力しない

" 現在の段落を整形
nnoremap <silent> Q gqap
vnoremap <silent> Q gqap

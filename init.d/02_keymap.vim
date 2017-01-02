scriptencoding utf-8

nnoremap ;; ;
let g:mapleader = ';'
let g:maplocalleader = "'"

"" Cursor moves
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <C-j> +
nnoremap <C-k> -

"" * で検索した後カーソル移動しない
nnoremap * *N
nnoremap # #N

"" Search with very magic
nnoremap / /\v

"" Maps to change frame sizes
" map + <C-W>+
" map - <C-W>-
" map > <C-W>>
" map < <C-W><

"" Clear highlights
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"" Format the current paragraph
nnoremap <silent> Q gqap
vnoremap <silent> Q gqap

"" Complete a space after a comma
" inoremap , ,<SPACE>

"" Insert time stamps (see Vim Technic Bible 4-1)
" cnoremap <expr> <C-x>dt strftime('%Y%m%d')
" cnoremap <expr> <C-x>ts strftime('%Y%m%d%H%M')

"" Substitute a word with a yanked word (see Vim Technic Bible 4-6)
" nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

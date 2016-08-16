"" ';' as a map leader and  let ';;' map ';'
nnoremap ;; ;
let g:mapleader = ';'

"" Cursor moves
nnoremap j gj
nnoremap k gk
nnoremap <C-j> +
nnoremap <C-k> -

"" * で検索した後カーソル移動しない
nnoremap * *N
nnoremap # #N

"" Maps to change frame sizes
map + <C-W>+
map - <C-W>-
map > <C-W>>
map < <C-W><

"" <C-c><C-c> clears highlights
nmap <silent> <C-c><C-c> :nohlsearch<CR>

"" Complete a space after a comma
" inoremap , ,<SPACE>

"" Insert time stamps (see Vim Technic Bible 4-1)
" cnoremap <expr> <C-x>dt strftime('%Y%m%d')
" cnoremap <expr> <C-x>ts strftime('%Y%m%d%H%M')

"" Substitute a word with a yanked word (see Vim Technic Bible 4-6)
" nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
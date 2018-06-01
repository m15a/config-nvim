scriptencoding utf-8

"" Set base directories before loading init scripts
let s:config_home = (exists('$XDG_CONFIG_HOME') ? $XDG_CONFIG_HOME : $HOME . '/.config') . '/nvim'
let s:data_home = (exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . '/.local/share') . '/nvim'
let s:cache_home = (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME . '/.cache') . '/nvim'

if exists('*minpac#init') "{{{1
  call minpac#init({'dir': s:data_home . '/site'})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "" Basic settings
  call minpac#add('bfredl/nvim-miniyank')
  call minpac#add('tpope/vim-sensible')

  "" Color scheme and status line
  call minpac#add('maximbaz/lightline-ale')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('jonathanfilip/vim-lucius')
  call minpac#add('roosta/vim-srcery')

  "" Text objects
  call minpac#add('wellle/targets.vim')
  call minpac#add('kana/vim-tabpagecd')
  call minpac#add('glts/vim-textobj-comment')
  call minpac#add('kana/vim-textobj-indent')
  call minpac#add('kana/vim-textobj-user')  " required by the other textobj plugins
  call minpac#add('chaoren/vim-wordmotion')  " replaces CamelCaseMotion

  "" UI enhancements
  call minpac#add('w0rp/ale')
  " call minpac#add('jiangmiao/auto-pairs')  " vim-surround provides it by <C-S>
  call minpac#add('rhysd/clever-f.vim')
  call minpac#add('lotabout/skim.vim')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('houtsnip/vim-emacscommandline')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('thinca/vim-visualstar')

  "" Japanese settings
  call minpac#add('fuenor/JpFormat.vim')

  "" Language extensions
  call minpac#add('JuliaEditorSupport/julia-vim')
  call minpac#add('jalvesaq/Nvim-R')
  call minpac#add('maverickg/stan.vim')
  call minpac#add('mnacamura/vim-fish')
  call minpac#add('rsmenon/vim-mathematica')
  call minpac#add('LnL7/vim-nix')
  call minpac#add('vim-pandoc/vim-pandoc-syntax')
  call minpac#add('baskerville/vim-sxhkdrc')
  call minpac#add('cespare/vim-toml')

  "" Applications inside Vim
  call minpac#add('vimwiki/vimwiki')

  " Sorted by repo name: `:'<,'>sort /\v^[^\/]+\//`
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

"" Basic settings {{{1

set clipboard+=unnamedplus
set complete+=k  " Enable dictionary completion
set cursorline
set diffopt+=vertical
set expandtab
set fileformat=unix
set fileformats=unix,dos,mac
set hidden  " Hide a buffer instead of unloading it
set ignorecase
set infercase
set list
set listchars=eol:¬,tab:>_,trail:_,extends:»,precedes:«,nbsp:_
set mouse=a
set nowrap
set nrformats=  " Only dicimal numbers are allowed for <CTRL-A/X>
set number
" set scroll=5
set path=.,,
set scrolloff=4
set shiftwidth=4
set showbreak=»
set showmatch
set smartcase
set smartindent
set softtabstop=-1
set suffixes+=.omc  " OMake
set textwidth=78
set virtualedit=all
set visualbell
set undofile
set wildignorecase
set wildmode=list:longest

"" Hack for vim + fish problem:
if &shell =~# '/fish$'
  let $SHELL = system("which sh | tr -d '\n'")
  let &shell = $SHELL
endif

"" Fix block paste when clipboard=unnamed[plus]
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

"" Color scheme and status line {{{1

if $COLORTERM ==# 'truecolor'  " VTE, Konsole, and iTerm2
  set termguicolors
endif
set background=dark

try
  colorscheme srcery
catch /\v^Vim%(\(\a+\))=:E185/
  " Suppress error messages
endtry

augroup color_tweaks
  autocmd!
  " Gruvbox orange
  au VimEnter,ColorScheme *
        \ hi Search    ctermbg=166 guibg=#d65d0e |
        \ hi IncSearch ctermbg=166 guibg=#d65d0e |
        \ hi PmenuSel  ctermbg=166 guibg=#d65d0e |

  " Srcery brred
  au VimEnter,ColorScheme *
        \ hi SpellBad ctermfg=9 guifg=#f75341 gui=undercurl
augroup END

if !exists('g:lightline') | let g:lightline = {} | endif
let g:lightline.colorscheme = 'srcery'

let g:lightline.component_expand = {
      \   'ale_warnings': 'lightline#ale#warnings',
      \   'ale_errors': 'lightline#ale#errors',
      \   'ale_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \   'ale_warnings': 'warning',
      \   'ale_errors': 'error',
      \ }
let g:lightline.active = {
      \  'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filename', 'modified' ],
      \     [ 'ale_errors', 'ale_warnings', 'ale_ok' ],
      \   ]
      \ }
let g:lightline#ale#indicator_ok = ''

"" Text objects {{{1

"" Separators of connected-words.without_spaces.likeThis
let g:wordmotion_spaces = '_-.'

"" UI enhancements {{{1

"" Practical Vim, Tip 42: '%%' expands to '%:h'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

"" Practical Vim, Tip 93: Repeat the last substitution by '&'
nnoremap & :&&<CR>
xnoremap & :&&<CR>

augroup remember_last_cursor_position
  autocmd!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exec "normal g`\"" |
        \ endif
augroup END

"" Colorize columns over &textwidth
exec 'set colorcolumn=+' . join(range(1, 256), ',+')

"" Use ripgrep if available
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"" Set <Leader> resp. <LocalLeader> to ';' resp. ',' by using clever-f
let g:mapleader = ';'
let g:maplocalleader = ','
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_repeat_last_char_inputs = ["\<Tab>"]

"" Search the text at the cursor or selected in visual mode
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N

"" Use `ga` for aligning instead of showing the ASCII value at the cursor
nnoremap gA ga
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

"“ Modern Vim, Tip 12: ALE mappings in the style of unimpaired
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"" Skim key mappings
noremap [skim] <Nop>
map <Leader>e [skim]
nmap [skim]f :<C-u>Files ./<CR>
nmap [skim]F :<C-u>Files 
nmap <silent> [skim]g :<C-u>GFiles<CR>
nmap <silent> [skim]G :<C-u>GFiles?<CR>
nmap <silent> [skim]b :<C-u>Buffers<CR>
nmap [skim]L :<C-u>Lines 
nmap [skim]l :<C-u>BLines 
nmap [skim]T :<C-u>Tags 
nmap [skim]t :<C-u>BTags 
nmap <silent> [skim]m :<C-u>Marks<CR>  " TODO: Marks does not work!
nmap <silent> [skim]h :<C-u>History<CR>  " TODO: History does not work!
nmap <silent> [skim]: :<C-u>History:<CR>
nmap <silent> [skim]/ :<C-u>History/<CR>
" nmap <silent> [skim]c :<C-u>Commits<CR>  " fugative.vim is required
" nmap <silent> [skim]C :<C-u>BCommits<CR>  " fugative.vim is required
" nmap <silent> [skim]: :<C-u>Commands<CR>  " TODO: Conflicts with History:

"" Japanese settings {{{1

set ambiwidth=double  " □や○の文字があってもカーソル位置がずれないようにする。
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932
set formatoptions+=mB  " 日本語の行同士の連結には空白を入力しない
set matchpairs+=（:）,「:」,『:』,【:】,［:］,〈:〉,《:》,‘:’,“:”
set spelllang+=cjk  " 日本語をスペルチェックから除外する

"" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
"" http://qiita.com/ssh0/items/9e7f0d8b8f033183dd0b
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

set formatexpr=jpfmt#formatexpr()

"" Language extensions {{{1

augroup lang_make "{{{2
  autocmd!
  au FileType make setl tabstop=4
augroup END

augroup lang_viml "{{{2
  autocmd!
  au FileType vim setl shiftwidth=2
augroup END

augroup lang_fish "{{{2
  autocmd!
  au FileType fish setl shiftwidth=2 | compiler fish
augroup END

augroup lang_markdown "{{{2
  autocmd!
  au BufNewFile,BufFilePre,BufRead *.md setl filetype=markdown.pandoc
  au FileType markdown*
        \ nnoremap <buffer> j gj|
        \ nnoremap <buffer> k gk|
        \ nnoremap <buffer> gj j|
        \ nnoremap <buffer> gk k|
        \ setl wrap
augroup END

let g:pandoc#syntax#conceal#use = 0

augroup lang_mathematica "{{{2
  autocmd!
  au BufNewFile,BufFilePre,BufRead *.m set filetype=mma
  au FileType mma setl shiftwidth=2
augroup END

let g:mma_candy = 0

augroup lang_r "{{{2
  autocmd!
  au TermOpen * setl nonumber
  au FileType r setl shiftwidth=2
augroup END

let g:R_assign = 0
let g:R_pdfviewer = 'zathura'
" let g:R_args = ['-q']

augroup lang_julia "{{{2
  autocmd!
  au FileType julia
        \ nnoremap <buffer> <silent> <LocalLeader>f :call julia#toggle_function_blockassign()<CR>
augroup END

"" Applications inside Vim {{{1

"" Vimwiki {{{2
let g:vimwiki_auto_chdir = 1
let s:vimwiki_root = '~/clouds/Dropbox/Documents/vimwiki'
let g:vimwiki_listsyms = ' x'
let s:vimwiki_default =
      \ { 'path': s:vimwiki_root . '/default'
      \ , 'template_path': s:vimwiki_root . '/_templates'
      \ }
let g:vimwiki_list = [ s:vimwiki_default ]

" vim: fdm=marker sw=2 et

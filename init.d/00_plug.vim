call plug#begin(g:nvimrc_data_home . '/plugged')

"" Look and feel
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'hallzy/lightline-onedark'
Plug 'ap/vim-buftabline'

"" Basic UI enhancements
Plug 'bfredl/nvim-miniyank' " Fix block paste when clipboard=unnamed
Plug 'Townk/vim-autoclose'
Plug 'bkad/CamelCaseMotion'
Plug 'godlygeek/tabular'
Plug 'houtsnip/vim-emacscommandline'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'

"" Japanese editing
Plug 'fuenor/JpFormat.vim'

"" Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"" Fish
Plug 'dag/vim-fish'

"" Tmux
Plug 'keith/tmux.vim'

"" VimL
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

"" Mathematica
Plug 'rsmenon/vim-mathematica'

"" Julia
Plug 'JuliaLang/julia-vim'

"" LaTeX
Plug 'lervag/vimtex'

"" Javascript
Plug 'othree/yajs.vim'            " for ES6
Plug 'othree/es.next.syntax.vim'  " for ES7
Plug 'gavocanov/vim-js-indent'
Plug 'carlitux/deoplete-ternjs'
" Plug 'othree/jspc.vim'  " don't know how to use it with deoplete-ternjs

"" JSON
Plug 'elzr/vim-json'

call plug#end()

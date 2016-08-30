call plug#begin(g:nvimrc_data_home . '/plugged')

"" Look and feel
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'hallzy/lightline-onedark'
Plug 'ap/vim-buftabline'

"" Basic UI enhancements
Plug 'bfredl/nvim-miniyank' " Fix block paste when clipboard=unnamed
Plug 'ervandew/matchem'
Plug 'bkad/CamelCaseMotion'
Plug 'godlygeek/tabular'
Plug 'houtsnip/vim-emacscommandline'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'kana/vim-textobj-entire'  " This conflicts with vimtex's mapping `ie`
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'icersong/timestamp.vim'

"" Japanese editing
Plug 'fuenor/JpFormat.vim'

"" Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"" SCM integration
Plug 'mhinz/vim-signify'

"" Fish
Plug 'onodera-punpun/vim-fish'

"" Tmux
Plug 'keith/tmux.vim'

"" VimL
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

"" OMake
Plug 'tkztmk/vim-omake'

"" Perl
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'

"" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/neco-ghc'
" Plug 'eagletmt/ghcmod-vim'  " missing vimproc warning in neovim
Plug 'itchyny/vim-haskell-sort-import'

"" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

"" Mathematica
Plug 'rsmenon/vim-mathematica'

"" Julia
Plug 'JuliaLang/julia-vim'

"" R
Plug 'jalvesaq/Nvim-R'

"" Stan
Plug 'mnacamura/mc-stan.vim'

"" LaTeX
Plug 'lervag/vimtex'

"" HTML/CSS
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'skammer/vim-css-color'  " too heavy!
Plug 'mattn/emmet-vim'
" Plug 'mattn/webapi-vim'

"" Javascript
Plug 'othree/yajs.vim'            " for ES6
Plug 'othree/es.next.syntax.vim'  " for ES7
Plug 'gavocanov/vim-js-indent'
Plug 'carlitux/deoplete-ternjs'
" Plug 'othree/jspc.vim'  " don't know how to use it with deoplete-ternjs

"" JSON
Plug 'elzr/vim-json'

"" TOML
Plug 'cespare/vim-toml'

call plug#end()

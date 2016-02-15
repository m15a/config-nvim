call plug#begin('~/.vim/bundle')

"" After install, cd /path/to/vimproc; and make -f make make_mac.mak
Plug 'Shougo/vimproc'

"" Look and feel
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'

"" Interface
Plug 'Townk/vim-autoclose'
Plug 'bkad/CamelCaseMotion'
Plug 'ghewgill/vim-scmdiff'
Plug 'godlygeek/tabular'
Plug 'houtsnip/vim-emacscommandline'
Plug 'majutsushi/tagbar'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/autodate.vim'
Plug 'vim-scripts/yanktmp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'fuenor/JpFormat.vim'

"" Unite
Plug 'Shougo/unite.vim'
Plug 'osyo-manga/unite-quickfix'

"" Ref
Plug 'thinca/vim-ref'

"" Neocomplete
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"" Perl
Plug 'vim-perl/vim-perl'
Plug 'y-uuki/unite-perl-module.vim'
Plug 'c9s/perlomni.vim'

"" Haskell
Plug 'dag/vim2hs'
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/unite-haddock'

"" OCaml
Plug 'the-lambda-church/merlin'

"" Mathematica
Plug 'rsmenon/vim-mathematica'

"" R
Plug 'jimmyharris/vim-r-plugin2'

"" Gauche
Plug 'aharisu/vim-gdev'

"" Fish
Plug 'dag/vim-fish'

"" Jq
Plug 'vito-c/jq.vim'

"" Markdown
Plug 'vim-scripts/vim-pandoc'

""LaTeX
Plug 'lervag/vimtex'

"" STAN
Plug 'maverickg/stan.vim'

call plug#end()

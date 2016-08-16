call plug#begin(g:nvimrc_data_home . '/plugged')

"" Look and feel
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'hallzy/lightline-onedark'

"" Fix block paste when clipboard=unnamed
Plug 'bfredl/nvim-miniyank'

"" Basic UI enhancements
Plug 'Townk/vim-autoclose'
Plug 'bkad/CamelCaseMotion'
Plug 'godlygeek/tabular'
Plug 'houtsnip/vim-emacscommandline'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

"" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

"" Tagbar
Plug 'majutsushi/tagbar'

call plug#end()

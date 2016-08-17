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

"" Japanese editing
Plug 'fuenor/JpFormat.vim'

"" Code completion
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

call plug#end()

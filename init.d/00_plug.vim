call plug#begin(g:nvimrc_data_home . '/plugged')

"" Look and feel
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'hallzy/lightline-onedark'

"" Fix block paste when clipboard=unnamed
Plug 'bfredl/nvim-miniyank'

call plug#end()

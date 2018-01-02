"" Set base directories before loading init scripts
let g:config_home = (exists('$XDG_CONFIG_HOME') ? $XDG_CONFIG_HOME : $HOME . "/.config") . "/nvim"
let g:data_home = (exists('$XDG_DATA_HOME') ? $XDG_DATA_HOME : $HOME . "/.local/share") . "/nvim"
let g:cache_home = (exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME . "/.cache") . "/nvim"

call plug#begin(g:data_home . '/plugged')
Plug 'tpope/vim-sensible'
call plug#end()

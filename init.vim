"" Set base directories before loading init scripts
let g:nvimrc_config_home = (exists($XDG_CONFIG_HOME) ?
      \ $XDG_CONFIG_HOME : $HOME . "/.config") . "/nvim"
let g:nvimrc_data_home = (exists($XDG_DATA_HOME)   ?
      \ $XDG_DATA_HOME : $HOME . "/.local/share") . "/nvim"
let g:nvimrc_cache_home = (exists($XDG_CACHE_HOME)  ?
      \ $XDG_CACHE_HOME : $HOME . "/.cache") . "/nvim"

runtime! init.d/0*_*.vim

" vim: foldmethod=marker

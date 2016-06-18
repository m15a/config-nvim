"" Set base directories before loading init scripts
let g:nvim_config = (exists ("$XDG_CONFIG_HOME") ? $XDG_CONFIG_HOME : $HOME."/.config"     ) . "/nvim"
let g:nvim_data   = (exists ("$XDG_DATA_HOME")   ? $XDG_DATA_HOME   : $HOME."/.local/share") . "/nvim"
let g:nvim_cache  = (exists ("$XDG_CACHE_HOME")  ? $XDG_CACHE_HOME  : $HOME."/.cache"      ) . "/nvim"

runtime! init.d/*.vim

let g:rust_conceal = 1
" let g:rust_conceal_mod_path = 1
" let g:rust_conceal_pub = 1
let g:rust_recommended_style = 0
" let g:rust_fold = 2
let g:rust_bang_comment_leader = 1

nnoremap [rust] <Nop>
nmap <LocalLeader>r [rust]
nmap [rust]r :<C-u>RustRun<Space>
nmap [rust]R :<C-u>RustRun!<Space>
nmap [rust]e :<C-u>RustExpand<Space>
nmap [rust]E :<C-u>RustExpand!<Space>
nmap [rust]f :<C-u>RustFmt<CR>

let g:racer_cmd    = $HOME . '/Library/Cargo/bin/racer'
let $RUST_SRC_PATH = $HOME . '/Repos/rust/src'

let g:tagbar_type_rust =
      \ { 'ctagstype' : 'rust'
      \ , 'kinds'     : [ 'T:types,type definitions'
      \                 , 'f:functions,function definitions'
      \                 , 'g:enum,enumeration names'
      \                 , 's:structure names'
      \                 , 'm:modules,module names'
      \                 , 'c:consts,static constants'
      \                 , 't:traits,traits'
      \                 , 'i:impls,trait implementations'
      \                 ]
      \ }
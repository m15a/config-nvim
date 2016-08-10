Plug 'thinca/vim-quickrun'

au QuickFixCmdPost * cfile
let g:quickrun_config = {}
let g:quickrun_config._ = {
      \ 'runner'                    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 40,
      \ 'outputter'                 : 'quickfix',
      \ 'outputter/buffer/split'    : '6sp',
      \ 'outputter/quickfix/open_cmd' : 'cfile',
      \ }
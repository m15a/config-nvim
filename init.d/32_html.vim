augroup nvimrc_html
  autocmd!
  au FileType html,css,scss setlocal shiftwidth=2 softtabstop=2
augroup END

" let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

augroup nvimrc_css3syntax
  autocmd!
  au FileType css,scss setlocal iskeyword+=-
augroup END

let g:user_emmet_install_global = 0
let g:user_emmet_mode = 'inv'

augroup nvimrc_emmet
  autocmd!
  au FileType html,css,scss EmmetInstall
augroup END

let g:tagbar_type_html =
      \ { 'ctagstype' : 'html'
      \ , 'kinds' : [ 'i:identifiers'
      \             , 'c:classes'
      \             ]
      \ }

let g:tagbar_type_css =
      \ { 'ctagstype' : 'Css'
      \ , 'kinds'     : [ 'c:classes'
      \                 , 's:selectors'
      \                 , 'i:identities'
      \                 ]
      \ }

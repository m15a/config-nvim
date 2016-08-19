" let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

let g:user_emmet_install_global = 0
let g:user_emmet_mode = 'inv'

augroup nvimrc_html
  autocmd!
  au FileType css,scss setlocal iskeyword+=-
  au FileType html,css,scss EmmetInstall
augroup END
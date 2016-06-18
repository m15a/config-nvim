" let g:syntastic_auto_loc_list = 1
map <silent> <Leader>E :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
if ! exists ('g:syntastic_mode_map')
  let g:syntastic_mode_map = { "mode"             : "passive",
                             \ "active_filetypes" : [],
                             \ "passive_filetypes": []
                             \ }
endif

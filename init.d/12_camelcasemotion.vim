"" Replace the default 'w', 'b', and 'e' mappings
map <silent> w  <Plug>CamelCaseMotion_w
map <silent> b  <Plug>CamelCaseMotion_b
map <silent> e  <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

"" Replace default 'iw' text-object and define 'ib' and 'ie' motions
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
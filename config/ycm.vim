let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
let g:syntastic_always_populate_loc_list=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_use_ultisnips_completer=1
let g:ycm_collect_identifiers_from_comments_and_strings=1

nnoremap <leader>yc :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>yd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ydc :YcmCompleter GoToDeclaration<CR>

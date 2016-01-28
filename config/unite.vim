nnoremap [Unite] <Nop>
nmap <Leader>m [Unite]

" tasks
nnoremap <silent>[Unite]g :Unite -silent -toggle

" outlines (also ctags)
nnoremap <silent>[Unite]c :Unite -silent -vertical -winwidth=35
            \ -direction=topleft -toggle outline<CR>



" unite locations
let g:unite_data_directory = expand('~/.config/nvim/unite')
let g:unite_source_file_mru_limit = 50
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_enable_short_source_names = 1
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_source_grep_max_candidates = 200


" menus
let g:unite_source_menu_menus = {}


" menu prefix key (for all Unite menus)
nnoremap [menu] <Nop>
nmap \; [menu]

" menus menu
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>


" files and dirs menu 
let g:unite_source_menu_menus.files = {
    \ 'description' : '          files & dirs',}
let g:unite_source_menu_menus.files.command_candidates = [
    \['▷ open file                                                  ⌘ \mo',
        \'Unite -start-insert file'],
    \['▷ open file with recursive search                            ⌘ \mO',
        \'Unite -start-insert file_rec/async'],
    \['▷ edit new file',
        \'Unite file/new'],
    \['▷ search directory',
        \'Unite directory'],
    \['▷ search recently used directories',
        \'Unite directory_mru'],
    \['▷ search directory with recursive search',
        \'Unite directory_rec/async'],
    \['▷ make new directory',
        \'Unite directory/new'],
    \['▷ change working directory',
        \'Unite -default-action=lcd directory'],
    \['▷ know current working directory',                            
        \'Unite output:pwd'],                                       
    \['▷ save as root                                               ⌘ :w!!',
        \'exe "write !sudo tee % >/dev/null"'],
    \['▷ quick save                                                 ⌘ \w',
        \'normal \w'],
    \['▷ open nerdtree                                              ⌘ F3',
        \'NERDTree'],
    \]


" files directory shortcuts

nnoremap <silent>[Unite]o :Unite -silent -start-insert file<CR>
nnoremap <silent>[Unite]O :Unite -silent -start-insert file_rec/async<CR>
nnoremap <silent>[Unite]m :Unite -silent file_mru<CR>
nnoremap <silent>[Unite]rs :Unite directory_rec/async<CR>
nnoremap <silent>[Unite]pwd :Unite output:pwd<CR>
map <F3> :NERDTreeToggle<CR>
 
nnoremap <leader>w :w!<CR>


" unicode / text menu
let g:unite_source_menu_menus.unicode = {
    \ 'description' : '        unicode info and diagraphs', } 

let g:unite_source_menu_menus.unicode.command_candidates = [
    \['▷ make digraph                                               ⌘ <F12>',
        \ '<Plug>(MakeDigraph)'],
    \['▷ char info                                                  ⌘ ga',
        \ '<Plug>(UnicodeGA)'],
    \['▷ Toggle Unicode Completion                                  ⌘ \un',
        \ '<Plug>(UnicodeGA)'],
    \]


" buffers, tabs & windows menu
let g:unite_source_menu_menus.navigation = {
    \ 'description' : '     navigate by buffers, tabs & windows',}
    
let g:unite_source_menu_menus.navigation.command_candidates = [
    \['▷ buffers                                                    ⌘ \mb',
        \'Unite buffer'],
    \['▷ tabs                                                       ⌘ \mB',
        \'Unite tab'],
    \['▷ windows',
        \'Unite window'],
    \['▷ new vertical window',
        \'vsplit'],
    \['▷ new horizontal window',
        \'split'],
    \['▷ close current window',
        \'close'],
    \['▷ delete buffer                                              ⌘ \tc',
        \'\tc'],
    \]

nnoremap <silent>[Unite]b :Unite -silent buffer<CR>
nnoremap <silent>[Unite]t :Unite -silent tab<CR>
nnoremap <silent>[Unite]B :Unite tab<CR>
nnoremap <silent>[Unite]w :Unite window<CR>
nnoremap <silent>[Unite]f :Unite -silent -no-split -start-insert -auto-preview line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview line<CR>
nnoremap <silent>[menu]n :Unite -silent menu:navigation<CR>


" buffer internal searching menu
let g:unite_source_menu_menus.searching = {
    \ 'description' : '      searches inside the current Buffer',
    \}
let g:unite_source_menu_menus.searching.command_candidates = [
    \['▷ search line                                                ⌘ \mf',
        \'Unite -auto-preview -start-insert line'],
    \['▷ search word under the cursor                               ⌘ [space]8',
        \'UniteWithCursorWord -no-split -auto-preview line'],
    \['▷ search outlines & tags (ctags)                             ⌘ \uc',
        \'Unite -vertical -winwidth=35 -direction=topleft -toggle outline'],
    \['▷ search marks',
        \'Unite -auto-preview mark'],
    \['▷ search folds',
        \'Unite -vertical -winwidth=30 -auto-highlight fold'],
    \['▷ search changes',
        \'Unite change'],
    \['▷ search jumps',
        \'Unite jump'],
    \['▷ search undos',
        \'Unite undo'],
    \]
nnoremap <silent>[menu]bs :Unite -silent menu:searching<CR>
nnoremap <silent>[Unite]f :Unite -auto-preview -start-insert line<CR>


" yanks, registers & history menu 
let g:unite_source_menu_menus.registers = {
    \ 'description' : '      yanks, registers & history',
    \}
let g:unite_source_menu_menus.registers.command_candidates = [
    \['▷ yanks                                                      ⌘ \mi',
        \'Unite history/yank'],
    \['▷ commands       (history)                                   ⌘ q:',
        \'Unite history/command'],
    \['▷ searches       (history)                                   ⌘ q/',
        \'Unite history/search'],
    \['▷ registers',
        \'Unite register'],
    \['▷ messages',
        \'Unite output:messages'],
    \]

nnoremap <silent>[Unite]i :Unite -silent history/yank<CR>
nnoremap <silent>H: :Unite history/command


" text editing menu 
let g:unite_source_menu_menus.text = {
    \ 'description' : '           text editing',
    \}
let g:unite_source_menu_menus.text.command_candidates = [
    \['▷ toggle search results highlight                            ⌘ ,eq',
        \'set invhlsearch'],
    \['▷ toggle fold                                                ⌘ za',
        \'normal za'],
    \['▷ open all folds                                             ⌘ zR',
        \'normal zR'],
    \['▷ close all folds                                            ⌘ zM',
        \'normal zM'],
    \['▷ copy to the clipboard                                      ⌘ \yy',
        \'normal ,y'],
    \['▷ paste from the clipboard                                   ⌘ \pp',
        \'normal ,p'],
    \['▷ toggle paste mode                                          ⌘ F2',
        \'normal, F2'],
    \]

set pastetoggle=<F2>

" code menu 
let g:unite_source_menu_menus.code = {
    \ 'description' : '           code tools',
    \}
let g:unite_source_menu_menus.code.command_candidates = [
    \['▷ Ycm Force Compile & Diagnostics                            ⌘ \yc',
        \'YcmCompleter YcmForceCompileAndDiagnostics'],
    \['▷ Ycm Go To Definition                                       ⌘ \yd',
        \'YcmCompleter GoToDefinition'],
    \['▷ Ycm Go To Declaration                                      ⌘ \ydc',
        \'YcmCompleter GoToDeclaration'],
    \['▷ LimeLight                                                  ⌘ F10',
    \'normal, F10'],
    \]

" bookmarks menu 
let g:unite_source_menu_menus.bookmarks = {
    \ 'description' : '      bookmarks',
    \}
let g:unite_source_menu_menus.bookmarks.command_candidates = [
    \['▷ open bookmarks',
        \'Unite bookmark:*'],
    \['▷ add bookmark',
        \'UniteBookmarkAdd'],
    \]

" vim menu 
let g:unite_source_menu_menus.vim = {
    \ 'description' : '            vim',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['▷ choose colorscheme',
        \'Unite colorscheme -auto-preview'],
    \['▷ mappings',
        \'Unite mapping -start-insert'],
    \['▷ edit configuration file (init.vim)',
        \'edit $MYVIMRC'],
    \['▷ choose filetype',
        \'Unite -start-insert filetype'],
    \['▷ vim commands',
        \'Unite -start-insert command'],
    \['▷ vim functions',
        \'Unite -start-insert function'],
    \['▷ vim runtimepath',
        \'Unite -start-insert runtimepath'],
    \['▷ vim command output',
        \'Unite output'],
    \['▷ unite sources',
        \'Unite source'],
    \['▷ kill process',
        \'Unite -default-action=sigkill -start-insert process'],
    \['▷ launch executable (dmenu like)',
        \'Unite -start-insert launcher'],
    \]

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep',
            \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

let g:default_context = {
    \ 'winheight' : 15,
    \ 'update_time' : 200,
    \ 'prompt' : '>>> ',
    \ 'enable_start_insert' : 0,
    \ 'enable_short_source_names' : 0,
    \ 'marked_icon' : '✓',
    \ 'ignorecase' : 1,
    \ 'smartcase' : 1,
\ }

call unite#custom#profile('default', 'context', default_context)

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_split_rule = 'botright'
let g:unite_data_directory = '~/.config/nvim/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

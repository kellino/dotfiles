scriptencoding=utf-8

"    d888888b d8b   db d888888b d888888b    db    db d888888b .88b  d88. 
"      `88'   888o  88   `88'      88       88    88   `88'   88'YbdP`88 
"       88    88V8o 88    88       88       Y8    8P    88    88  88  88 
"       88    88 V8o88    88       88       `8b  d8'    88    88  88  88 
"      .88.   88  V888   .88.      88    db  `8bd8'    .88.   88  88  88 
"    Y888888P VP   V8P Y888888P    YP    VP    YP    Y888888P YP  YP  YP 
                                                                    


call plug#begin('~/.config/nvim/bundle/')

"" general
Plug 'itchyny/lightline.vim'
Plug 'critiqjo/vim-bufferline'

Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch' " unix commands
Plug 'justinmk/vim-dirvish' " file browser
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim' 
Plug 'jamessan/vim-gnupg'
Plug 'bfredl/nvim-miniyank'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'

"" Colourscheme(s)
Plug 'iCyMind/NeoSolarized'

"" Text Editing
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/vim-easy-align'
Plug 'beloglazov/vim-online-thesaurus', { 'for' : ['text', 'markdown', 'tex', 'latex'] }

"" markdown
function! BuildComposer(info)
  if a:info.status !=# 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'for' : 'markdown', 'do': function('BuildComposer') }
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }

"" Git
Plug 'tpope/vim-fugitive' | Plug 'airblade/vim-gitgutter'

"" General coding
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake' | Plug 'dojoteef/neomake-autolint'
Plug 'majutsushi/tagbar',   { 'on' : 'TagbarToggle' }

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' 

"" C 
Plug 'tweekmonster/deoplete-clang2', { 'for' : ['c', 'cpp'] }
Plug 'Shougo/neoinclude.vim',        { 'for' : ['c', 'cpp'] }
Plug 'arakashic/chromatica.nvim',    { 'for' : ['c', 'cpp', 'vim'] }

"" Haskell
Plug 'eagletmt/neco-ghc',             { 'for' : 'haskell' }
Plug 'Twinside/vim-haskellFold',      { 'for' : 'haskell' }
Plug 'Twinside/vim-hoogle',           { 'for' : 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for' : 'haskell' }
Plug 'itchyny/vim-haskell-indent',    { 'for' : 'haskell' }

"" Coq, OCaml, Ott
Plug '~/Programming/Coq/SF/coqvim', { 'for' : 'coq' } | Plug 'let-def/vimbufsync', { 'for' : 'coq' }
Plug 'psosera/ott-vim',             { 'for' : 'ott' }

"" Agda
Plug 'derekelkins/agda-vim', { 'for' : 'agda' }

"" Idris
Plug 'idris-hackers/idris-vim', { 'for' : 'idris' }

"" Python
Plug 'zchee/deoplete-jedi', { 'for' : 'python' }
Plug 'klen/python-mode',    { 'for' : 'python' }

"" LaTeX
Plug 'lervag/vimtex',     { 'for' : ['tex', 'latex'] }

"" Rust
Plug 'rust-lang/rust.vim',   { 'for' : 'rust' }
Plug 'racer-rust/vim-racer', { 'for' : 'rust' }

"" Shell Scripting & Vim
Plug 'vim-scripts/sh.vim--Cla', { 'for' : 'sh' }
Plug 'Shougo/neco-vim',         { 'for' : 'vim' }
Plug 'Shougo/neco-syntax',      { 'for' : 'vim' }

"" wordnet wip
Plug 'kellino/wordnet.nvim', { 'do' : function('DoRemote') }

call plug#end()

 "======================="
 "      Appearance       "
 "======================="

set termguicolors
set background=dark
let g:neosolarized_termtrans=1
let g:neosolarized_contrast='high'
let g:neosolarized_italic = 1
colorscheme NeoSolarized

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

hi SpellBad ctermfg=1
hi SpellCap ctermfg=9
hi SpellRare cterm=undercurl
hi SpellLocal cterm=undercurl
hi FoldColumn ctermbg=235
hi LineNr ctermfg=200
hi Comment cterm=italic


 "======================="
 "      Navigation       "
 "======================="

"" unbind ESC
inoremap fj <Esc>

"" undo undo (redo)
inoremap \U <c-r>

"" Switch between splits
set  splitbelow
set  splitright
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set noequalalways  " don't allow vim to resize splits
set cmdheight=2
set nowrap
set relativenumber
set number
set sidescrolloff=0
set autoindent
set copyindent
set textwidth=100
set noshowmode

"" tabs
set shiftwidth=4
set softtabstop=4
set expandtab

"" search
set ignorecase
set smartcase
set wrapscan
set nohlsearch

set scrolloff=10

set hidden

"" Remove backups
set nobackup
set nowritebackup
set noswapfile

set list
set listchars=tab:▸\ ,nbsp:%,extends:,precedes:
set linebreak
set completeopt=longest,menuone
set wildmode=longest,list:longest,full
set wildignore=*.o,*~,*.pyc,.git/*
set shortmess=aoOtT
set inccommand=split

"" Tab
noremap <Leader>to :tabnew<CR>
noremap <Leader>tt :tabclose<CR>

"" Copy / Paste
set clipboard+=unnamedplus
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)
map <Leader>b <Plug>(miniyank-toblock)

""
let g:maplocalleader = ','

"" quick save and quit
map qq :wqa!<CR>
map qa :qa!<CR>
map <leader>w :w<CR>

"" History settings
set history=500

"" location window
map lo :lopen<CR>
map lc :lclose<CR>

"" Omnifunc completions
set omnifunc=syntaxcomplete#Complete

" conceal level
set conceallevel=2
set concealcursor=c

"" ctags / hasktags
set tags=./tags;

"" formatting and spelling
augroup formatting
    au BufEnter,BufRead *.md    setlocal formatprg=par\ -w120
    au BufEnter,BufRead *.md    setlocal equalprg=par\ -w120
    au BufEnter,BufRead *.txt   setlocal formatprg=par\ -w120
    au BufEnter,BufRead *.txt   setlocal equalprg=par\ -w120
    au BufEnter,BufRead *.tex   setlocal formatprg=par\ -w120
    au BufEnter,BufRead *.tex   setlocal equalprg=par\ -w120
    au BufEnter,BufRead *.latex setlocal formatprg=par\ -w120
    au BufEnter,BufRead *.latex setlocal equalprg=par\ -w120
augroup END

augroup spelling
    au BufRead *.md       setlocal spell spelllang=en_gb
    au BufRead *.txt      setlocal spell spelllang=en_gb
    au BufRead *.tex      setlocal spell spelllang=en_gb
    au BufRead *.latex    setlocal spell spelllang=en_gb
    au BufRead /tmp/mutt* setlocal spell spelllang=en_gb
augroup END


"============================="
"      Plugin Options         "
"============================="

"" tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> : TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> : TmuxNavigateDown<cr>
nnoremap <silent> <c-k> : TmuxNavigateUp<cr>
nnoremap <silent> <BS>  : TmuxNavigateRight<cr>
nnoremap <silent> <c-p> : TmuxNavigatePrevious<cr>

"" Neomake
augroup Neomake
    autocmd! BufWritePost * Neomake
augroup END

"" vim-sneak
let g:sneak#label = 1

"" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

"----------------"
"    Deoplete    "
"----------------"

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni#input_patterns = {}

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" neosnippet
imap <s-tab> <Plug>(neosnippet_expand_or_jump)
smap <s-tab> <Plug>(neosnippet_expand_or_jump)
xmap <s-tab> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/.config/nvim/after/snippets'

"" latex
let g:deoplete#omni#input_patterns.tex = 
        \   '\\(?:'
        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \  .  '|hyperref\s*\[[^]]*'
        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
        \  .')'
let g:tex_flavor = 'latex'
let g:tex_stylish = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_index_split_pos = 'below'
let g:vimtex_fold_enabled=1

"" Unicode
map md <Plug>(MakeDigraph)

"" Tagbar
map <F8> :TagbarToggle<CR>

"" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" gitgutter
let g:gitgutter_async=0

"" ocaml
augroup ocaml
    au BufRead,BufNewFile *.ml,*.mli compiler ocaml
augroup END

"" agda
let g:agda_extraincpaths = ['/usr/share/agda/lib/prim/', '/home/david/.agda/1.3/']
let g:NERDCustomDelimiters = { 'agda': { 'left': '{-', 'right': '-}', 'nested': 1, 'leftAlt': '--', 'nestedAlt': 1 } }

"" coq
let g:deoplete#omni#input_patterns.coq = '[^ \t]'
let g:highlight_coq_checked=1

"" idris
let g:idris_indent_if = 3
let g:idris_indent_case = 5
let g:idris_indent_let = 4
let g:idris_indent_where = 6
let g:idris_indent_do = 3
let g:idris_indent_rewrite = 8
let g:idris_conceal = 1

"" python
let g:pymode_rope=0

"" chromatica
let g:chromatica#enable_at_startup=1

"" while language
au BufRead,BufNewFile *.while set filetype=while

"" gratr
au BufRead,BufNewFile *.gr set filetype=gratr

"" markdown composer
let g:markdown_composer_autostart=0

"" other stuff
try
    source ~/.config/nvim/config/lightline.vim
    source ~/.config/nvim/config/haskell.vim
    source ~/.config/nvim/config/terminal.vim
    source ~/.config/nvim/config/startify.vim
    source ~/.config/nvim/config/fzf.vim
catch
endtry
